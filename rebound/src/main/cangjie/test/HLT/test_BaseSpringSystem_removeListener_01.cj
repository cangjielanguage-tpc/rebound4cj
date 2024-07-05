// 3rd_party_lib:rebound4ohos/rebound/src/main/cangjie/build/rebound

from rebound import rebound.*
from std import random.*

@Test
public class TestBaseSpringSystemRemoveListener{
    /******public func removeListener(listenerToRemove: ?SpringSystemListener): Unit*****/
    @TestCase
    func test_BaseSpringSystem_removeListener_01(): Unit {
        var springLooper=SteppingLooper()
        var baseSpringSystem=BaseSpringSystem(springLooper)
        var newListener=SubSpringSystemListener()
        baseSpringSystem.removeListener(newListener)
        baseSpringSystem.loop(Float64(999999.999))
        @Assert(baseSpringSystem.getAllSprings().size,0)
    }
    @TestCase
    func test_BaseSpringSystem_removeListener_02(): Unit {
        var springLooper=SteppingLooper()
        var baseSpringSystem=BaseSpringSystem(springLooper)
        var newListener=SubSpringSystemListener()
        baseSpringSystem.addListener(newListener)
        baseSpringSystem.removeListener(newListener)
        baseSpringSystem.loop(Float64(999999.999))
        @Assert(baseSpringSystem.getAllSprings().size,2)
    }
    @TestCase
    func test_BaseSpringSystem_removeListener_03(): Unit {
        var springLooper=SteppingLooper()
        var baseSpringSystem=BaseSpringSystem(springLooper)
        var newListener01=SubSpringSystemListener()
        var newListener02=SubSpringSystemListener()
        var newListener03=SubSpringSystemListener()
        baseSpringSystem.addListener(newListener01)
        baseSpringSystem.addListener(newListener02)
        baseSpringSystem.removeListener(newListener03)
        baseSpringSystem.loop(Float64(999999.999))
        @Assert(baseSpringSystem.getAllSprings().size,4)
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
        let r=Random().nextInt64()
        var has: Int64 = 31*r*31
        return has
    }
}