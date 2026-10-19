package rebound

public abstract class SimpleSpringListener <: SpringListener {
    public init() { }

    override public open func onSpringUpdate(_: Spring): Unit { }

    override public open func onSpringAtRest(_: Spring): Unit { }

    override public open func onSpringActivate(_: Spring): Unit { }

    override public open func onSpringEndStateChange(_: Spring): Unit { }
}