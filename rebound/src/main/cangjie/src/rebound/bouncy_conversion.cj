/*
 * @Copyright (c) Huawei Technologies Co., Ltd. 2024-2024. All rights reserved.
 */

package rebound.rebound

internal import std.math.pow

public class BouncyConversion {
    private var mBouncyTension: Float64 = 0.0

    private var mBouncyFriction: Float64 = 0.0

    private var mSpeed: Float64

    private var mBounciness: Float64

    public init(speed: Float64, bounciness: Float64) {
        mSpeed = speed
        mBounciness = bounciness
        var b: Float64 = normalize(bounciness / 1.7, 0.0, 20.0)
        b = project_normal(b, 0.0, 0.8)
        let s: Float64 = normalize(speed / 1.7, 0.0, 20.0)
        mBouncyTension = project_normal(s, 0.5, 200.0)
        mBouncyFriction = quadratic_out_interpolation(b, b3_nobounce(mBouncyTension), 0.01)
    }

    public func getSpeed(): Float64 { 
        return mSpeed
    }

    public func getBounciness(): Float64 {
        return mBounciness
    }

    public func getBouncyTension(): Float64 {
        return mBouncyTension
    }

    public func getBouncyFriction(): Float64 {
        return mBouncyFriction
    }

    private func normalize(value: Float64, startValue: Float64, endValue: Float64): Float64 {
        return (value - startValue) / (endValue - startValue)
    }

    private func project_normal(n: Float64, start: Float64, end: Float64): Float64 {
        return start + (n * (end - start))
    }

    private func linear_interpolation(t: Float64, start: Float64, end: Float64): Float64 {
        return t * end + (1.0 - t) * start
    }

    private func quadratic_out_interpolation(t: Float64, start: Float64, end: Float64): Float64 {
        return linear_interpolation(2.0 * t - t * t, start, end)
    }

    private func b3_friction1(x: Float64): Float64 {
        return (0.0007 * pow(x, 3.0)) - (0.031 * pow(x, 2.0)) + 0.64 * x + 1.28
    }

    private func b3_friction2(x: Float64): Float64 {
        return (0.000044 * pow(x, 3)) - (0.006 * pow(x, 2)) + 0.36 * x + 2.0
    }

    private func b3_friction3(x: Float64): Float64 {
        return (0.00000045 * pow(x, 3)) - (0.000332 * pow(x, 2)) + 0.1078 * x + 5.84
    }

    private func b3_nobounce(tension: Float64): Float64 {
        var friction = 0.0
        if (tension <= 18.0) {
            friction = b3_friction1(tension)
        } else if (tension > 18.0 && tension <= 44.0) {
            friction = b3_friction2(tension)
        } else if (tension > 44.0) {
            friction = b3_friction3(tension)
        } else {
            if (!(false)) {
                throw Exception("false")
            }
        }
        return friction
    }
}
