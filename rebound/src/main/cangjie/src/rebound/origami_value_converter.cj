/*
 * @Copyright (c) Huawei Technologies Co., Ltd. 2024-2024. All rights reserved.
 */

package rebound.rebound

public class OrigamiValueConverter {
    public init() { }

    public static func tensionFromOrigamiValue(oValue: Float64): Float64 {
        return if (oValue == 0.0) { 0.0 } else { (oValue - 30.0) * 3.62 + 194.0 }
    }

    public static func origamiValueFromTension(tension: Float64): Float64 {
        return if (tension == 0.0) { 0.0 } else { (tension - 194.0) / 3.62 + 30.0 }
    }

    public static func frictionFromOrigamiValue(oValue: Float64): Float64 {
        return if (oValue == 0.0) { 0.0 } else { (oValue - 8.0) * 3.0 + 25.0 }
    }

    public static func origamiValueFromFriction(friction: Float64): Float64 {
        return if (friction == 0.0) { 0.0 } else { (friction - 25.0) / 3.0 + 8.0 }
    }
}