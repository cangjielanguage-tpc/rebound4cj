// EXEC: cjc %import-path %L %l %f
// EXEC: ./main

from std import unittest.*
from std import unittest.testmacro.*
from std import collection.*
from rebound import rebound.*

main(): Int64 {
    var test = TestBouncyConversion()
    test.test01()
    test.test02()
    test.test03()
    test.test04()
    test.test05()
    test.test06()
    return 0
}

@Test
public class TestBouncyConversion {

    @TestCase
    public func test01(): Unit {
        let bc: BouncyConversion = BouncyConversion(0.0, 6.6)
        bc.getSpeed()
        bc.getBounciness()
        bc.getBouncyTension()
        bc.getBouncyFriction()
    }

    @TestCase
    public func test02(): Unit {
        let bc: BouncyConversion = BouncyConversion(0.2, 100.2)
        bc.getSpeed()
        bc.getBounciness()
        bc.getBouncyTension()
        bc.getBouncyFriction()
    }

    @TestCase
    public func test03(): Unit {
        let bc: BouncyConversion = BouncyConversion(0.0, 55.3)
        bc.getSpeed()
        bc.getBounciness()
        bc.getBouncyTension()
        bc.getBouncyFriction()
    }

    @TestCase
    public func test04(): Unit {
        let bc: BouncyConversion = BouncyConversion(5.5, 6.6)
        bc.getSpeed()
        bc.getBounciness()
        bc.getBouncyTension()
        bc.getBouncyFriction()
    }

    @TestCase
    public func test05(): Unit {
        let bc: BouncyConversion = BouncyConversion(7.9, 6.6)
        bc.getSpeed()
        bc.getBounciness()
        bc.getBouncyTension()
        bc.getBouncyFriction()
    }

    @TestCase
    public func test06(): Unit {
        let bc: BouncyConversion = BouncyConversion(8.7, 6.6)
        bc.getSpeed()
        bc.getBounciness()
        bc.getBouncyTension()
        bc.getBouncyFriction()
    }
}