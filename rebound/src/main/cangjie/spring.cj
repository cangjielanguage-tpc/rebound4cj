/*
 * @Copyright (c) Huawei Technologies Co., Ltd. 2024-2024. All rights reserved.
 */

package rebound

internal import std.math.abs
internal import std.collection.HashSet

public class Spring <: Hashable & Equatable<Spring> {
    private static var ID: Int64 = 0

    private static let MAX_DELTA_TIME_SEC: Float64 = 0.064

    private static let SOLVER_TIMESTEP_SEC: Float64 = 0.001

    private var mSpringConfig: SpringConfig = SpringConfig(0.0, 0.0)

    private var mOvershootClampingEnabled: Bool = false

    let mId: String

    private let mCurrentState = Spring_PhysicsState()

    private let mPreviousState = Spring_PhysicsState()

    private let mTempState = Spring_PhysicsState()

    private var mStartValue: Float64 = 0.0

    private var mEndValue: Float64 = 0.0

    private var mWasAtRest = true

    private var mRestSpeedThreshold = 0.005

    private var mDisplacementFromRestThreshold = 0.005

    private var mListeners: ConcurrentArrayList<SpringListener> = ConcurrentArrayList<SpringListener>()

    private var mTimeAccumulator = 0.0

    private let mSpringSystem: BaseSpringSystem

    public prop mCurrentValue: Float64 {
        get() {
            getCurrentValue()
        }
    }

    init(springSystem: BaseSpringSystem) {
        mSpringSystem = springSystem
        mId = "spring:" + (match (0) { case _ => ID++; ID - 1 }).toString()
        setSpringConfig(SpringConfig.defaultConfig)
    }

    func clearAllListeners(): Unit {
        let optList: ArrayList<SpringListener> = ArrayList<SpringListener>()
        for (k in mListeners.iterators()) {
            optList.add(k)
        }
        for (i in 0..optList.size) {
            mListeners.remove(optList[i])
        }
    }

    public func destroy(): Unit {
        clearAllListeners()
        mSpringSystem.deregisterSpring(this)
    }

    public func getId(): String {
        return mId
    }

    public func setSpringConfig(springConfig: SpringConfig): Spring {
        mSpringConfig = springConfig
        return this
    }

    public func getSpringConfig(): SpringConfig {
        return mSpringConfig
    }

    public func setCurrentValue(currentValue: Float64): Spring {
        return setCurrentValue(currentValue, true)
    }

    public func setCurrentValue(currentValue: Float64, atRest: Bool): Spring {
        mStartValue = currentValue
        mCurrentState.position = currentValue
        mSpringSystem.activateSpring(this.mId)
        for (listener in mListeners.iterators()) {
            listener.onSpringUpdate(this)
        }
        if (atRest) {
            setAtRest()
        }
        return this
    }

    public func getStartValue(): Float64 {
        return mStartValue
    }

    public func getCurrentValue(): Float64 {
        return mCurrentState.position
    }

    public func getCurrentDisplacementDistance(): Float64 {
        return getDisplacementDistanceForState(mCurrentState)
    }

    private func getDisplacementDistanceForState(state: Spring_PhysicsState): Float64 {
        return abs(mEndValue - state.position)
    }

    public func setEndValue(endValue: Float64): Spring {
        if (mEndValue == endValue) {
            if (isAtRest()) {
                return this
            }
        }
        mStartValue = mCurrentState.position
        mEndValue = endValue
        mSpringSystem.activateSpring(this.mId)
        for (listener in mListeners.iterators()) {
            listener.onSpringEndStateChange(this)
        }
        return this
    }

    public func getEndValue(): Float64 {
        return mEndValue
    }

    public func setVelocity(velocity: Float64): Spring {
        if (velocity == mCurrentState.velocity) {
            return this
        }
        mCurrentState.velocity = velocity
        mSpringSystem.activateSpring(this.mId)
        return this
    }

    public func getVelocity(): Float64 {
        return mCurrentState.velocity
    }

    public func setRestSpeedThreshold(restSpeedThreshold: Float64): Spring {
        mRestSpeedThreshold = restSpeedThreshold
        return this
    }

    public func getRestSpeedThreshold(): Float64 {
        return mRestSpeedThreshold
    }

    public func setRestDisplacementThreshold(displacementFromRestThreshold: Float64): Spring {
        mDisplacementFromRestThreshold = displacementFromRestThreshold
        return this
    }

    public func getRestDisplacementThreshold(): Float64 {
        return mDisplacementFromRestThreshold
    }

    public func setOvershootClampingEnabled(overshootClampingEnabled: Bool): Spring {
        mOvershootClampingEnabled = overshootClampingEnabled
        return this
    }

    public func isOvershootClampingEnabled(): Bool {
        return mOvershootClampingEnabled
    }

    public func isOvershooting(): Bool {
        return mSpringConfig.tension > 0.0 && ((mStartValue < mEndValue && mCurrentValue > mEndValue) || (mStartValue > mEndValue && mCurrentValue < mEndValue))
    }

    func advance(realDeltaTime: Float64): Unit {
        var atRest = isAtRest()
        if (atRest && mWasAtRest) {
            return
        }
        var adjustedDeltaTime = realDeltaTime
        if (realDeltaTime > MAX_DELTA_TIME_SEC) {
            adjustedDeltaTime = MAX_DELTA_TIME_SEC
        }
        mTimeAccumulator += adjustedDeltaTime
        let tension = mSpringConfig.tension
        let friction = mSpringConfig.friction
        var position = mCurrentState.position
        var velocity = mCurrentState.velocity
        var tempPosition = mTempState.position
        var tempVelocity = mTempState.velocity
        var aVelocity: Float64 = 0.0
        var aAcceleration: Float64 = 0.0
        var bVelocity: Float64 = 0.0
        var bAcceleration: Float64 = 0.0
        var cVelocity: Float64 = 0.0
        var cAcceleration: Float64 = 0.0
        var dVelocity: Float64 = 0.0
        var dAcceleration: Float64 = 0.0
        var dxdt: Float64 = 0.0
        var dvdt: Float64 = 0.0
        while (mTimeAccumulator >= SOLVER_TIMESTEP_SEC) {
            mTimeAccumulator -= SOLVER_TIMESTEP_SEC
            if (mTimeAccumulator < SOLVER_TIMESTEP_SEC) {
                mPreviousState.position = position
                mPreviousState.velocity = velocity
            }
            aVelocity = velocity
            aAcceleration = (tension * (mEndValue - tempPosition)) - friction * velocity
            tempPosition = position + aVelocity * SOLVER_TIMESTEP_SEC * 0.5
            tempVelocity = velocity + aAcceleration * SOLVER_TIMESTEP_SEC * 0.5
            bVelocity = tempVelocity
            bAcceleration = (tension * (mEndValue - tempPosition)) - friction * tempVelocity
            tempPosition = position + bVelocity * SOLVER_TIMESTEP_SEC * 0.5
            tempVelocity = velocity + bAcceleration * SOLVER_TIMESTEP_SEC * 0.5
            cVelocity = tempVelocity
            cAcceleration = (tension * (mEndValue - tempPosition)) - friction * tempVelocity
            tempPosition = position + cVelocity * SOLVER_TIMESTEP_SEC
            tempVelocity = velocity + cAcceleration * SOLVER_TIMESTEP_SEC
            dVelocity = tempVelocity
            dAcceleration = (tension * (mEndValue - tempPosition)) - friction * tempVelocity
            dxdt = 1.0 / 6.0 * (aVelocity + 2.0 * (bVelocity + cVelocity) + dVelocity)
            dvdt = 1.0 / 6.0 * (aAcceleration + 2.0 * (bAcceleration + cAcceleration) + dAcceleration)
            position += dxdt * SOLVER_TIMESTEP_SEC
            velocity += dvdt * SOLVER_TIMESTEP_SEC
        }
        mTempState.position = tempPosition
        mTempState.velocity = tempVelocity
        mCurrentState.position = position
        mCurrentState.velocity = velocity
        if (mTimeAccumulator > 0.0) {
            interpolate(mTimeAccumulator / SOLVER_TIMESTEP_SEC)
        }
        if (isAtRest() || (mOvershootClampingEnabled && isOvershooting())) {
            if (tension > 0.0) {
                mStartValue = mEndValue
                mCurrentState.position = mEndValue
            } else {
                mEndValue = mCurrentState.position
                mStartValue = mEndValue
            }
            setVelocity(0.0)
            atRest = true
        }
        var notifyActivate = false
        if (mWasAtRest) {
            mWasAtRest = false
            notifyActivate = true
        }
        var notifyAtRest = false
        if (atRest) {
            mWasAtRest = true
            notifyAtRest = true
        }
        for (listener in mListeners.iterators()) {
            if (notifyActivate) {
                listener.onSpringActivate(this)
            }
            listener.onSpringUpdate(this)
            if (notifyAtRest) {
                listener.onSpringAtRest(this)
            }
        }
    }

    public func systemShouldAdvance(): Bool {
        return !isAtRest() || !wasAtRest()
    }

    public func wasAtRest(): Bool {
        return mWasAtRest
    }

    public func isAtRest(): Bool {
        let velocityAtRest: Bool = abs(mCurrentState.velocity) <= mRestSpeedThreshold
        let displacementDistance: Float64 = getDisplacementDistanceForState(mCurrentState)
        let displacementAtRest: Bool = displacementDistance <= mDisplacementFromRestThreshold
        let tensionIsZero: Bool = mSpringConfig.tension == 0.0
        let restCondition: Bool = displacementAtRest || tensionIsZero
        let isAtRest: Bool = restCondition && velocityAtRest
        return isAtRest
    }

    public func setAtRest(): Spring {
        mEndValue = mCurrentState.position
        mTempState.position = mCurrentState.position
        mCurrentState.velocity = 0.0
        return this
    }

    private func interpolate(alpha: Float64): Unit {
        mCurrentState.position = mCurrentState.position * alpha + mPreviousState.position * (1.0 - alpha)
        mCurrentState.velocity = mCurrentState.velocity * alpha + mPreviousState.velocity * (1.0 - alpha)
    }

    public func addListener(newListener: SpringListener): Spring {
        mListeners.put(newListener)
        return this
    }

    public func removeListener(listenerToRemove: SpringListener): Spring {
        mListeners.remove(listenerToRemove)
        return this
    }

    public func removeAllListeners(): Spring {
        clearAllListeners()
        return this
    }

    public func currentValueIsApproximately(value: Float64): Bool {
        return abs(mCurrentValue - value) <= getRestDisplacementThreshold()
    }

    public operator func ==(other: Spring): Bool {
        return refEq(this, other)
    }

    public operator func !=(other: Spring): Bool {
        return !refEq(this, other)
    }

    @OverflowWrapping
    public override func hashCode(): Int64 {
        var has: Int64 = 31 * mId.hashCode()
        return has
    }
}

class Spring_PhysicsState {
    var position: Float64 = 0.0
    var velocity: Float64 = 0.0
}