/*
 * @Copyright (c) Huawei Technologies Co., Ltd. 2024-2024. All rights reserved.
 */

package rebound

from std import math.max
from std import math.min

public class SpringUtil {

    public static func mapValueFromRangeToRange(value: Float64, fromLow: Float64, fromHigh: Float64, toLow: Float64, toHigh: Float64): Float64 {
        let fromRangeSize: Float64 = fromHigh - fromLow
        let toRangeSize: Float64 = toHigh - toLow
        let valueScale: Float64 = (value - fromLow) / fromRangeSize
        return toLow + (valueScale * toRangeSize)
    }

    public static func clamp(value: Float64, low: Float64, high: Float64): Float64 {
        return min(max(value, low), high)
    }
}