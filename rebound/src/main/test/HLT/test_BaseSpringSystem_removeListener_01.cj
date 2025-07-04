// 3rd_party_lib:rebound4cj/rebound/src/main/cangjie/target/release/rebound

import rebound.*
import std.random.*

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
        @Assert(baseSpringSystem.getAllSprings().size,0)
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

    let r = Random().nextInt64()

    public func onBeforeIntegrate(springSystem:BaseSpringSystem):Unit{
        springSystem.createSpring()
    }
    public func onAfterIntegrate(springSystem:BaseSpringSystem):Unit{
        springSystem.createSpring()
    }
    public operator func !=(that: SpringSystemListener): Bool {
        if (this.hashCode() != that.hashCode()) {
            return true
        }
        return false
    }
    public operator func ==(that: SpringSystemListener): Bool {
        if (this.hashCode() == that.hashCode()) {
            return true
        }
        return false
    }

    @OverflowWrapping
    public override func hashCode(): Int64 {
        var has: Int64 = 31 * r * 31
        return has
    }
}