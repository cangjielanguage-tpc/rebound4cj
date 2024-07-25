/*
 * @Copyright (c) Huawei Technologies Co., Ltd. 2024-2024. All rights reserved.
 */

package rebound.rebound

public abstract class SpringLooper {

    protected var mSpringSystem: ?BaseSpringSystem = None

    public func setSpringSystem(springSystem: ?BaseSpringSystem): Unit {
        mSpringSystem = springSystem
    }

    public func start(): Unit

    public func stop(): Unit
}