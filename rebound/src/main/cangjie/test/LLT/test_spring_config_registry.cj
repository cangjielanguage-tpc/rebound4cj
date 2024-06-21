// EXEC: cjc %import-path %L %l %f
// EXEC: ./main

from std import unittest.*
from std import unittest.testmacro.*
from std import collection.*
from rebound import rebound.*

main(): Int64 {
    var test = TestSpringConfigRegistry()
    test.test01()
    test.test02()
    test.test03()
    test.test04()
    test.test05()
    test.test06()
    return 0
}

@Test
public class TestSpringConfigRegistry {

    @TestCase
    public func test01(): Unit {
        let scr = SpringConfigRegistry.getInstance()
        try {
            scr.addSpringConfig(SpringConfig(10.0, 10.1), "k1")
        } catch (e: Exception) {
            e.printStackTrace()
        }
    }

    @TestCase
    public func test02(): Unit {
        let scr = SpringConfigRegistry.getInstance()
        try {
            scr.addSpringConfig(SpringConfig(0.0, 1.1), "k2")
        } catch (e: Exception) {
            e.printStackTrace()
        }
    }

    @TestCase
    public func test03(): Unit {
        let scr = SpringConfigRegistry.getInstance()
        let scr2 = SpringConfigRegistry.getInstance()
        let sc = SpringConfig(0.0, 1.1)
        let flag = scr2.addSpringConfig(sc, "test")
        try {
            scr.removeSpringConfig(sc)
        } catch (e: Exception) {
            e.printStackTrace()
        }
    }

    @TestCase
    public func test04(): Unit {
        let scr2 = SpringConfigRegistry.getInstance()
        let map = scr2.getAllSpringConfig()
        @Assert(map.size, 3)
    }

    @TestCase
    public func test05(): Unit {
        let scr2 = SpringConfigRegistry.getInstance()
        let sc = SpringConfig(0.0, 1.1)
        let map = scr2.getAllSpringConfig()
        scr2.removeSpringConfig(sc)
        @Assert(map.size, 3)
    }

    @TestCase
    public func test06(): Unit {
        let scr2 = SpringConfigRegistry.getInstance()
        let map = scr2.getAllSpringConfig()
        scr2.removeAllSpringConfig()
        @Assert(map.size, 0)
    }

}