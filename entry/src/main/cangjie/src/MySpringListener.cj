/*
 * @Copyright (c) Huawei Technologies Co., Ltd. 2024-2024. All rights reserved.
 */

let springSystem: rebound.BaseSpringSystem = rebound.BaseSpringSystem(AnimationLooper())
let spring: rebound.Spring = springSystem.createSpring()

public class MySpringListener <: SimpleSpringListener {
    var str: String = ""

    var imageSizeFunc: (Float64)-> Unit

    public init(imageSizeFunc: (Float64)->Unit) {
        this.imageSizeFunc = imageSizeFunc
    }

    public func onSpringUpdate(spring: Spring): Unit {
        let value: Float64 = spring.getCurrentValue()
        let v = rebound.SpringUtil.mapValueFromRangeToRange(value, 0.0, 1.0, 1.0, 0.5)
        imageSizeFunc(v)
    }

    public func onSpringEndStateChange(spring: Spring): Unit {}

    public operator func !=(that: SpringListener): Bool {
        return !(this == that)
    }
    public operator func ==(that: SpringListener): Bool {
        return true
    }

    @OverflowWrapping
    public override func hashCode(): Int64 {
        var has: Int64 = 31 * str.hashCode()
        return has
    }
}