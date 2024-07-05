// 3rd_party_lib:rebound4ohos/rebound/src/main/cangjie/build/rebound

from rebound import rebound.*
@Test
public class TestBaseSpringSystemRemoveAllListeners{
    /******public func removeAllListeners(): Unit*****/
    @TestCase
    func test_BaseSpringSystem_removeAllListeners_01(): Unit {
        var springLooper=SteppingLooper()
        var baseSpringSystem=BaseSpringSystem(springLooper)
        baseSpringSystem.removeAllListeners()
        baseSpringSystem.loop(Float64(999999.999))
        @Assert(baseSpringSystem.getAllSprings().size,0)
    }
    @TestCase
    func test_BaseSpringSystem_removeAllListeners_02(): Unit {
        var springLooper=SteppingLooper()
        var baseSpringSystem=BaseSpringSystem(springLooper)
        var newListener=SubSpringSystemListener()
        baseSpringSystem.addListener(newListener)
        baseSpringSystem.removeAllListeners()
        baseSpringSystem.loop(Float64(999999.999))
        @Assert(baseSpringSystem.getAllSprings().size,0)
    }
    @TestCase
    func test_BaseSpringSystem_removeAllListeners_03(): Unit {
        var springLooper=SteppingLooper()
        var baseSpringSystem=BaseSpringSystem(springLooper)
        var newListener01=SubSpringSystemListener()
        var newListener02=SubSpringSystemListener()
        var newListener03=SubSpringSystemListener()
        baseSpringSystem.addListener(newListener01)
        baseSpringSystem.addListener(newListener02)
        baseSpringSystem.addListener(newListener03)
        baseSpringSystem.removeAllListeners()
        baseSpringSystem.loop(Float64(999999.999))
        @Assert(baseSpringSystem.getAllSprings().size,0)
    }
}

public class SubSpringSystemListener <: SpringSystemListener{
    public func onBeforeIntegrate(springSystem:BaseSpringSystem):Unit{
        springSystem.createSpring()
    }
    public func onAfterIntegrate(springSystem:BaseSpringSystem):Unit{
        springSystem.createSpring()
    }
    public operator func !=(that: SpringSystemListener): Bool {
        return !(this == that)
    }
    public operator func ==(that: SpringSystemListener): Bool {
        return true
    }

    @OverflowWrapping
    public override func hashCode(): Int64 {
        var has: Int64 = 31
        return has
    }
}