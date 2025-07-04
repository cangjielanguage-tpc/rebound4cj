package rebound

public class SpringConfig <: Hashable & Equatable<SpringConfig> {
    public var friction: Float64 = 0.0

    public var tension: Float64 = 0.0

    public static var defaultConfig: SpringConfig = SpringConfig.fromOrigamiTensionAndFriction(40.0, 7.0)

    public init(tension: Float64, friction: Float64) {
        this.tension = tension
        this.friction = friction
    }

    public static func fromOrigamiTensionAndFriction(qcTension: Float64, qcFriction: Float64): SpringConfig {
        return SpringConfig(OrigamiValueConverter.tensionFromOrigamiValue(qcTension), OrigamiValueConverter.frictionFromOrigamiValue(qcFriction))
    }

    public static func fromBouncinessAndSpeed(bounciness: Float64, speed: Float64): SpringConfig {
        let bouncyConversion: BouncyConversion = BouncyConversion(speed, bounciness)
        return fromOrigamiTensionAndFriction(bouncyConversion.getBouncyTension(), bouncyConversion.getBouncyFriction())
    }

    public static func coastingConfigWithOrigamiFriction(friction: Float64): SpringConfig {
        return SpringConfig(0.0, OrigamiValueConverter.frictionFromOrigamiValue(friction))
    }

    public operator func ==(other: SpringConfig): Bool {
        return refEq(this, other)
    }

    public operator func !=(other: SpringConfig): Bool {
        return !refEq(this, other)
    }

    @OverflowWrapping
    public override func hashCode(): Int64 {
        var has: Int64 = 31 * (friction.hashCode() + tension.hashCode())
        return has
    }
}