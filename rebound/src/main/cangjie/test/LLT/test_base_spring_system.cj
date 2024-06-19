// EXEC: cjc %import-path %L %l %f
// EXEC: ./main

from std import unittest.*
from std import unittest.testmacro.*
from std import collection.*
from rebound import rebound.*

main(): Int64 {
    var test = TestBaseSpringSystem()
    test.test01()
    test.test02()
    test.test03()
    test.test04()
    test.test05()
    test.test06()
    test.test07()
    return 0
}

@Test
public class TestBaseSpringSystem {

    @TestCase
    public func test01(): Unit {
        let bss: BaseSpringSystem = BaseSpringSystem(SteppingLooper())
        let s: Spring = bss.createSpring()
        try {
            bss.getSpringById(None)
        } catch (e: IllegalArgumentException) {
            println(e.printStackTrace())
        }
    }

    @TestCase
    public func test02(): Unit {
        try {
            var bss2: BaseSpringSystem = BaseSpringSystem(None)
        } catch (e: Exception) {
            println(e.printStackTrace())
        }        
    }

    @TestCase
    public func test03(): Unit {
        let bss: BaseSpringSystem = BaseSpringSystem(SteppingLooper())   
        let s2: ?Spring = bss.getSpringById("k1")
        let springs: ArrayList<Spring> = bss.getAllSprings()
        bss.loop(16.0)
        try {
            bss.addListener(None)
        } catch (e: IllegalArgumentException) {
            println(e.printStackTrace())
        }
    }

    @TestCase
    public func test04(): Unit {
        let bss: BaseSpringSystem = BaseSpringSystem(SteppingLooper())   
        let lis: SpringSystemListener = MySpringSystemListener()
        bss.addListener(lis)
        try {
            bss.removeListener(None)
        } catch (e: IllegalArgumentException) {
            println(e.printStackTrace())
        }
    }

    @TestCase
    public func test05(): Unit {
        let bss: BaseSpringSystem = BaseSpringSystem(SteppingLooper())   
        let lis: SpringSystemListener = MySpringSystemListener()
        bss.addListener(lis)
        bss.removeListener(lis)
        @Assert(bss.getIsIdle(), true)
    }

    @TestCase
    public func test06(): Unit {
        let bss: BaseSpringSystem = BaseSpringSystem(SteppingLooper())   
        bss.removeAllListeners()
        @Assert(bss.getIsIdle(), true)
    }

    @TestCase
    public func test07(): Unit {
        let bss: BaseSpringSystem = BaseSpringSystem(SteppingLooper())
        let s: Spring = bss.createSpring()
        s.setCurrentValue(7.7, true)
        s.setEndValue(0.5)
        s.setVelocity(6.2)
        s.setRestSpeedThreshold(9.9)
        s.setRestDisplacementThreshold(5.55)
        s.setOvershootClampingEnabled(false)
        let lis: SpringSystemListener = MySpringSystemListener()
        bss.addListener(lis)
        bss.loop(16.0)
        let b1 = s.systemShouldAdvance()
        println(b1)
    }
}

class MySpringSystemListener <: SpringSystemListener {
    var str: String = ""
    public func onBeforeIntegrate(springSystem: BaseSpringSystem): Unit {}
    public func onAfterIntegrate(springSystem: BaseSpringSystem): Unit {}
    public operator func !=(that: SpringSystemListener): Bool {
        return !(this == that)
    }
    public operator func ==(that: SpringSystemListener): Bool {
        return true
    }

    @OverflowWrapping
    public override func hashCode(): Int64 {
        var has: Int64 = 31 * str.hashCode()
        return has
    }
}