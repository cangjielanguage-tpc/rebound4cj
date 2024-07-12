/*
 * @Copyright (c) Huawei Technologies Co., Ltd. 2024-2024. All rights reserved.
 */

from std import time.*
from std import sync.*
public class AnimationLooper <: SpringLooper {

    public init() {}

    func getSpringSystem(): BaseSpringSystem {
        return springSystem
    }

    public func start(): Unit {
        let s = getSpringSystem()
        sleep(Duration.second / 60)
        s.loop(Float64(SystemDateTime.getCurrentTime()))
    }

    public func stop(): Unit {
    }
}