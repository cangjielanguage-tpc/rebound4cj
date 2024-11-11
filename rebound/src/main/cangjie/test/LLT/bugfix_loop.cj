// EXEC: cjc %import-path %L %l %f
// EXEC: ./main

import std.unittest.*
import std.unittest.testmacro.*
import std.collection.*
import rebound.*

main(): Int64 {
    var test = BugfixLoop()
    test.test_BaseSpringSystem_Loop_01()
    return 0
}

@Test
public class BugfixLoop {

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

}

public class SubSpringSystemListener <: SpringSystemListener{
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
        var has: Int64 = 31
        return has
    }
}