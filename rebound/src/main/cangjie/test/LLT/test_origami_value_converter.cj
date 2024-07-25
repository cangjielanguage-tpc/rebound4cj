// EXEC: cjc %import-path %L %l %f
// EXEC: ./main

import std.unittest.*
import std.unittest.testmacro.*
import std.collection.*
import rebound.rebound.*

main(): Int64 {
    var test = TestOrigamiValueConverter()
    test.test01()
    test.test02()
    test.test03()
    test.test04()
    test.test05()
    test.test06()
    return 0
}

@Test
public class TestOrigamiValueConverter {

    @TestCase
    public func test01(): Unit {
        let ovc: OrigamiValueConverter = OrigamiValueConverter()
        println(OrigamiValueConverter.tensionFromOrigamiValue(100.0))
        println(OrigamiValueConverter.origamiValueFromTension(100.0))
        println(OrigamiValueConverter.frictionFromOrigamiValue(50.0))
        println(OrigamiValueConverter.origamiValueFromFriction(50.0))
    }

    @TestCase
    public func test02(): Unit {
        let ovc: OrigamiValueConverter = OrigamiValueConverter()
        println(OrigamiValueConverter.tensionFromOrigamiValue(50.5))
        println(OrigamiValueConverter.origamiValueFromTension(50.5))
        println(OrigamiValueConverter.frictionFromOrigamiValue(33.2))
        println(OrigamiValueConverter.origamiValueFromFriction(33.2))
    }

    @TestCase
    public func test03(): Unit {
        let ovc: OrigamiValueConverter = OrigamiValueConverter()
        println(OrigamiValueConverter.tensionFromOrigamiValue(100.1))
        println(OrigamiValueConverter.origamiValueFromTension(50.5))
        println(OrigamiValueConverter.frictionFromOrigamiValue(33.2))
        println(OrigamiValueConverter.origamiValueFromFriction(33.2))
    }

    @TestCase
    public func test04(): Unit {
        let ovc: OrigamiValueConverter = OrigamiValueConverter()
        println(OrigamiValueConverter.tensionFromOrigamiValue(50.5))
        println(OrigamiValueConverter.origamiValueFromTension(50.5))
        println(OrigamiValueConverter.frictionFromOrigamiValue(11.1))
        println(OrigamiValueConverter.origamiValueFromFriction(33.2))
    }

    @TestCase
    public func test05(): Unit {
        let ovc: OrigamiValueConverter = OrigamiValueConverter()
        println(OrigamiValueConverter.tensionFromOrigamiValue(50.5))
        println(OrigamiValueConverter.origamiValueFromTension(5.5))
        println(OrigamiValueConverter.frictionFromOrigamiValue(33.2))
        println(OrigamiValueConverter.origamiValueFromFriction(33.2))
    }

    @TestCase
    public func test06(): Unit {
        let ovc: OrigamiValueConverter = OrigamiValueConverter()
        println(OrigamiValueConverter.tensionFromOrigamiValue(5.5))
        println(OrigamiValueConverter.origamiValueFromTension(50.5))
        println(OrigamiValueConverter.frictionFromOrigamiValue(33.2))
        println(OrigamiValueConverter.origamiValueFromFriction(11.2))
    }
}