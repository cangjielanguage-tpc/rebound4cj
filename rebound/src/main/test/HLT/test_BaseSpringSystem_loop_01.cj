// 3rd_party_lib:rebound4cj/rebound/src/main/cangjie/target/release/rebound

import rebound.*
import std.random.*

@Test
public class TestBaseSpringSystemLoop{
    /******public func loop(ellapsedMillis: Float64): Unit*****/
    @TestCase
    func test_BaseSpringSystem_Loop_01(): Unit {
        //有Listener,有激活的Spring:Spring存在激活的Spring，也存在没有激活的Spring
        var springLooper=SteppingLooper()
        var baseSpringSystem=BaseSpringSystem(springLooper)
        var spring=baseSpringSystem.createSpring()
        spring.setCurrentValue(Float64(12345.43))
        baseSpringSystem.createSpring()
        baseSpringSystem.createSpring()
        var newListener=SubSpringSystemListener()
        baseSpringSystem.addListener(newListener)
        baseSpringSystem.loop(Float64(4567.88))
        @Assert(baseSpringSystem.getAllSprings().size,5)
    }
    @TestCase
    func test_BaseSpringSystem_Loop_02(): Unit {
        //有Listener,有激活的Spring:多个Listener,多个激活的Spring
        var springLooper=SteppingLooper()
        var baseSpringSystem=BaseSpringSystem(springLooper)
        var spring01=baseSpringSystem.createSpring()
        spring01.setCurrentValue(Float64(12345.43))
        var spring02=baseSpringSystem.createSpring()
        spring02.setCurrentValue(Float64(72345.43))
        var spring03=baseSpringSystem.createSpring()
        spring03.setCurrentValue(Float64(43422345.43))
        baseSpringSystem.createSpring()
        baseSpringSystem.createSpring()
        baseSpringSystem.createSpring()
        baseSpringSystem.createSpring()
        var newListener01=SubSpringSystemListener()
        var newListener02=SubSpringSystemListener()
        var newListener03=SubSpringSystemListener()
        baseSpringSystem.addListener(newListener01)
        baseSpringSystem.addListener(newListener02)
        baseSpringSystem.addListener(newListener03)
        baseSpringSystem.loop(Float64(4567.88))
        @Assert(baseSpringSystem.getAllSprings().size,13)
    }
    @TestCase
    func test_BaseSpringSystem_Loop_03(): Unit {
        //有Listener,无激活的Spring:有Spring
        var springLooper=SteppingLooper()
        var baseSpringSystem=BaseSpringSystem(springLooper)
        baseSpringSystem.createSpring()
        baseSpringSystem.createSpring()
        var newListener=SubSpringSystemListener()
        baseSpringSystem.addListener(newListener)
        baseSpringSystem.loop(Float64(4567.88))
        @Assert(baseSpringSystem.getAllSprings().size,4)
    }
    @TestCase
    func test_BaseSpringSystem_Loop_04(): Unit {
        //有Listener,无激活的Spring:无Spring
        var springLooper=SteppingLooper()
        var baseSpringSystem=BaseSpringSystem(springLooper)
        var newListener=SubSpringSystemListener()
        baseSpringSystem.addListener(newListener)
        baseSpringSystem.loop(Float64(4567.88))
        @Assert(baseSpringSystem.getAllSprings().size,2)
    }
    @TestCase
    func test_BaseSpringSystem_Loop_05(): Unit {
        //无Listener,有激活的Spring
        var springLooper=SteppingLooper()
        var baseSpringSystem=BaseSpringSystem(springLooper)
        var spring01=baseSpringSystem.createSpring()
        spring01.setCurrentValue(Float64(12345.43))
        baseSpringSystem.loop(Float64(4567.88))
        @Assert(baseSpringSystem.getAllSprings().size,1)
    }
    @TestCase
    func test_BaseSpringSystem_Loop_06(): Unit {
        //无Listener,无激活的Spring
        var springLooper=SteppingLooper()
        var baseSpringSystem=BaseSpringSystem(springLooper)
        baseSpringSystem.createSpring()
        baseSpringSystem.loop(Float64(4567.88))
        @Assert(baseSpringSystem.getAllSprings().size,1)
    }
    @TestCase
    func test_BaseSpringSystem_Loop_07(): Unit {
        var springLooper=SteppingLooper()
        var baseSpringSystem=BaseSpringSystem(springLooper)
        baseSpringSystem.loop(Float64(4567.88))
        @Assert(baseSpringSystem.getAllSprings().size,0)
    }
    @TestCase
    func test_BaseSpringSystem_Loop_08(): Unit {
        //负数
        var springLooper=SteppingLooper()
        var baseSpringSystem=BaseSpringSystem(springLooper)
        var spring=baseSpringSystem.createSpring()
        spring.setCurrentValue(Float64(12345.43))
        baseSpringSystem.createSpring()
        baseSpringSystem.createSpring()
        var newListener=SubSpringSystemListener()
        baseSpringSystem.addListener(newListener)
        baseSpringSystem.loop(Float64(-4567.88))
        @Assert(baseSpringSystem.getAllSprings().size,5)
    }
    @TestCase
    func test_BaseSpringSystem_Loop_09(): Unit {
        //0
        var springLooper=SteppingLooper()
        var baseSpringSystem=BaseSpringSystem(springLooper)
        var spring=baseSpringSystem.createSpring()
        spring.setCurrentValue(Float64(12345.43))
        baseSpringSystem.createSpring()
        baseSpringSystem.createSpring()
        var newListener=SubSpringSystemListener()
        baseSpringSystem.addListener(newListener)
        baseSpringSystem.loop(Float64(0))
        @Assert(baseSpringSystem.getAllSprings().size,5)
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