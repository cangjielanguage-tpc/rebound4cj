// EXEC: cjc %import-path %L %l %f
// EXEC: ./main

from std import unittest.*
from std import unittest.testmacro.*
from std import collection.*
from rebound import rebound.*

main(): Int64 {
    var test = TestSpring()
    test.test01()
    test.test02()
    test.test03()
    test.test04()
    test.test05()
    return 0
}

@Test
public class TestSpring {

    @TestCase
    public func test01(): Unit {
        let bss: BaseSpringSystem = BaseSpringSystem(SteppingLooper())
        let s: Spring = bss.createSpring()
        let id = s.getId()
        @Assert(id, "spring:0")
        try {
            s.setSpringConfig(None)
        } catch (e: Exception) {
            e.printStackTrace()
        }
        s.destroy()
    }

    @TestCase
    public func test02(): Unit {
        let bss: BaseSpringSystem = BaseSpringSystem(SteppingLooper())
        let s: Spring = bss.createSpring()
        s.setSpringConfig(SpringConfig.defaultConfig)
        s.getSpringConfig()
        s.setCurrentValue(7.7)
        s.destroy()
    }

    @TestCase
    public func test03(): Unit {
        let bss: BaseSpringSystem = BaseSpringSystem(SteppingLooper())
        let s: Spring = bss.createSpring()
        let s2: Spring = bss.createSpring()
        s.setCurrentValue(7.7, true)
        let v1 = s.getStartValue()
        @Assert(v1, 7.700000)
        let v2 = s.getCurrentValue()
        @Assert(v2, 7.700000)
        let v3 = s.getCurrentDisplacementDistance()
        @Assert(v3, 0.000000)
        s.setEndValue(0.5)
        let v4 = s.getEndValue()
        @Assert(v4, 0.500000)
        s.setVelocity(6.2)
        let v5 = s.getVelocity()
        @Assert(v5, 6.200000)
        s.setRestSpeedThreshold(9.9)
        let v6 = s.getRestSpeedThreshold()
        @Assert(v6, 9.900000)
        s.setRestDisplacementThreshold(5.55)
        let v7 = s.getRestDisplacementThreshold()
        @Assert(v7, 5.550000)
        s.setOvershootClampingEnabled(false)
        let b1 = s.isOvershootClampingEnabled()
        @Assert(b1, false)
        let b2 = s.isOvershooting()
        @Assert(b2, false)
        let b3 = s.systemShouldAdvance()
        @Assert(b3, true)
        let b4 = s.wasAtRest()
        @Assert(b4, true)
        let b5 = s.isAtRest()
        @Assert(b5, false)
        s.setAtRest()
        @Assert(s.isAtRest(), true)
        try {
            s.addListener(None)
        } catch (e: IllegalArgumentException) {
            println(e.printStackTrace())
        }
        let b6 = s.currentValueIsApproximately(33.3)
        @Assert(b6, false)
        s.hashCode()
        @Assert(s == s2, false)
        @Assert(s != s2, true)
        s.destroy()
    }

    @TestCase
    public func test04(): Unit {
        let bss: BaseSpringSystem = BaseSpringSystem(SteppingLooper())
        let s: Spring = bss.createSpring()
        s.setCurrentValue(6.3, true)
        let v1 = s.getStartValue()
        @Assert(v1, 6.300000)
        let v2 = s.getCurrentValue()
        @Assert(v2, 6.300000)
        let v3 = s.getCurrentDisplacementDistance()
        @Assert(v3, 0.000000)
        s.setEndValue(0.55)
        let v4 = s.getEndValue()
        @Assert(v4, 0.550000)
    }

    @TestCase
    public func test05(): Unit {
        let bss: BaseSpringSystem = BaseSpringSystem(SteppingLooper())
        let s: Spring = bss.createSpring()
        let lis: MySpringSystemListener2 = MySpringSystemListener2()
        s.addListener(lis)
        try {
            s.removeListener(None)
        } catch (e: IllegalArgumentException) {
            println(e.printStackTrace())
        }
        s.removeListener(lis)
        s.removeAllListeners()
    }

}

class MySpringSystemListener2 <: SimpleSpringListener {

    var str: String = ""

    public func onSpringUpdate(_: Spring): Unit { }

    public func onSpringAtRest(_: Spring): Unit { }

    public func onSpringActivate(_: Spring): Unit { }

    public func onSpringEndStateChange(_: Spring): Unit { }

    public operator func !=(that: SpringListener): Bool {
        return !(this == that)
    }
    public operator func ==(that: SpringListener): Bool {
        return true
    }

    @OverflowWrapping
    public override func hashCode(): Int64 {
        var has: Int64 = 31 * str.hashCode()
        return has
    }
}