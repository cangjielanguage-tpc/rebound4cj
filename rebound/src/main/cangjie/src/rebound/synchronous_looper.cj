/*
 * @Copyright (c) Huawei Technologies Co., Ltd. 2024-2024. All rights reserved.
 */

package rebound.rebound

public class SynchronousLooper <: SpringLooper {
    public static var SIXTY_FPS = 16.6667

    private var mTimeStep: Float64 = 0.0

    private var mRunning: Bool = false

    public init() {
        super()
        mTimeStep = SIXTY_FPS
    }

    public func getTimeStep(): Float64 {
        return mTimeStep
    }

    public func setTimeStep(timeStep: Float64): Unit {
        mTimeStep = timeStep
    }

    public override func start(): Unit {
        mRunning = true
        if (mSpringSystem.isSome()) {
            while (!mSpringSystem.getOrThrow().mIdle) {
                if (mRunning == false) {
                    break
                }
                mSpringSystem.getOrThrow().loop(mTimeStep)
            }
        }
    }

    public override func stop(): Unit {
        mRunning = false
    }
}
