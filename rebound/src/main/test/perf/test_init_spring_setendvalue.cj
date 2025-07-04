// EXEC: cjc %import-path %L %l %f
// EXEC: ./main

import std.unittest.*
import std.unittest.testmacro.*
import std.collection.*
import std.time.*
import std.random.*
import rebound.*

main(): Int64 {
    var test = TestInitSpring()
    // test.test10()
    // test.test100()
    // test.test1000()
    test.test10000()
    // test.test100000()
    return 0
}

@Test
public class TestInitSpring {

    let steppingLopper: SteppingLooper = SteppingLooper()
    let springListener = MySpringListener()

    @TestCase
    public func test10(): Unit {
        var num = 10
        let start = DateTime.now()
        for (i in 0..num) {
            let bss: BaseSpringSystem = BaseSpringSystem(steppingLopper)
            let s: Spring = bss.createSpring()
            s.setSpringConfig(SpringConfig.defaultConfig)
            s.addListener(springListener)
            s.setEndValue(1.0)
            s.setEndValue(0.0)
        }
        let end = (DateTime.now() - start).toNanoseconds()
        println("TestSuiteInitSpring_"  + "${num}" + " : " + "${end / num}" + " ns/op")
    }

    @TestCase
    public func test100(): Unit {
        var num = 100
        let start = DateTime.now()
        for (i in 0..num) {
            let bss: BaseSpringSystem = BaseSpringSystem(steppingLopper)
            let s: Spring = bss.createSpring()
            s.setSpringConfig(SpringConfig.defaultConfig)
            s.addListener(springListener)
            s.setEndValue(1.0)
            s.setEndValue(0.0)
        }
        let end = (DateTime.now() - start).toNanoseconds()
        println("TestSuiteInitSpring_"  + "${num}" + " : " + "${end / num}" + " ns/op")
    }

    @TestCase
    public func test1000(): Unit {
        var num = 1000
        let start = DateTime.now()
        for (i in 0..num) {
            let bss: BaseSpringSystem = BaseSpringSystem(steppingLopper)
            let s: Spring = bss.createSpring()
            s.setSpringConfig(SpringConfig.defaultConfig)
            s.addListener(springListener)
            s.setEndValue(1.0)
            s.setEndValue(0.0)
        }
        let end = (DateTime.now() - start).toNanoseconds()
        println("TestSuiteInitSpring_"  + "${num}" + " : " + "${end / num}" + " ns/op")
    }

    @TestCase
    public func test10000(): Unit {
        var num = 10000
        let start = DateTime.now()
        for (i in 0..num) {
            let bss: BaseSpringSystem = BaseSpringSystem(steppingLopper)
            let s: Spring = bss.createSpring()
            s.setSpringConfig(SpringConfig.defaultConfig)
            s.addListener(springListener)
            s.setEndValue(1.0)
            s.setEndValue(0.0)
        }
        let end = (DateTime.now() - start).toNanoseconds()
        println("TestSuiteInitSpring_"  + "${num}" + " : " + "${end / num}" + " ns/op")
    }

    @TestCase
    public func test100000(): Unit {
        var num = 100000
        let start = DateTime.now()
        for (i in 0..num) {
            let bss: BaseSpringSystem = BaseSpringSystem(steppingLopper)
            let s: Spring = bss.createSpring()
            s.setSpringConfig(SpringConfig.defaultConfig)
            s.addListener(springListener)
            s.setEndValue(1.0)
            s.setEndValue(0.0)
        }
        let end = (DateTime.now() - start).toNanoseconds()
        println("TestSuiteInitSpring_"  + "${num}" + " : " + "${end / num}" + " ns/op")
    }
}

public class MySpringListener <: SimpleSpringListener {

    let r = Random().nextInt64()

    public operator func !=(that: SpringListener): Bool {
        return !(this == that)
    }
    public operator func ==(that: SpringListener): Bool {
        return true
    }

    @OverflowWrapping
    public override func hashCode(): Int64 {
        var has: Int64 = 31 * r * 31
        return has
    }
}