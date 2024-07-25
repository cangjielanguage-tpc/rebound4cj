/*
 * @Copyright (c) Huawei Technologies Co., Ltd. 2024-2024. All rights reserved.
 */

package rebound.rebound

public class SteppingLooper <: SpringLooper {
    public init() {
        super()
    }

    private var mStarted: Bool = false

    private var mLastTime: Int64 = 0

    override public func start(): Unit {
        mStarted = true
        mLastTime = 0
    }

    public func step(interval: Int64): Bool {
        if (mSpringSystem.isNone() || !mStarted) {
            return false
        }
        let currentTime: Int64 = mLastTime + interval
        mSpringSystem.getOrThrow().loop(Float64(currentTime))
        mLastTime = currentTime
        return mSpringSystem.getOrThrow().mIdle
    }

    override public func stop(): Unit {
        mStarted = false
    }
}