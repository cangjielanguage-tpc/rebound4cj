package rebound

public abstract class SpringLooper {

    protected var mSpringSystem: ?BaseSpringSystem = None

    public func setSpringSystem(springSystem: ?BaseSpringSystem): Unit {
        mSpringSystem = springSystem
    }

    public func start(): Unit

    public func stop(): Unit
}