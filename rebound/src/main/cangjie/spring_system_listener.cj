package rebound

public interface SpringSystemListener <: Hashable & Equatable<SpringSystemListener> {
    func onBeforeIntegrate(springSystem: BaseSpringSystem): Unit

    func onAfterIntegrate(springSystem: BaseSpringSystem): Unit
}