// EXEC: cjc %import-path %L %l %f
// EXEC: ./main

from std import unittest.*
from std import unittest.testmacro.*
from std import collection.*
from rebound import rebound.*

main(): Int64 {
    var test = TestSpringConfig()
    test.test01()
    test.test02()
    test.test03()
    test.test04()
    test.test05()
    test.test06()
    return 0
}

@Test
public class TestSpringConfig {

    @TestCase
    public func test01(): Unit {
        let sc = SpringConfig(0.0, 1.1)
        let sc2 = SpringConfig.defaultConfig
        @Assert(sc == sc2, false)
    }

    @TestCase
    public func test02(): Unit {
        let sc = SpringConfig.fromOrigamiTensionAndFriction(40.0, 7.0)
        let sc2 = SpringConfig.fromBouncinessAndSpeed(0.0, 1.1)
        @Assert(sc == sc2, false)
    }

    @TestCase
    public func test03(): Unit {
        let sc = SpringConfig.fromBouncinessAndSpeed(0.0, 1.1)
        let sc2 = SpringConfig.coastingConfigWithOrigamiFriction(1.1)
        @Assert(sc == sc2, false)
    }

    @TestCase
    public func test04(): Unit {
        let sc = SpringConfig.defaultConfig
        let sc2 = SpringConfig.fromOrigamiTensionAndFriction(40.0, 7.0)
        @Assert(sc == sc2, false)
    }

    @TestCase
    public func test05(): Unit {
        let sc = SpringConfig.defaultConfig
        let sc2 = SpringConfig.fromBouncinessAndSpeed(0.0, 1.1)
        @Assert(sc != sc2, true)
    }

    @TestCase
    public func test06(): Unit {
        let sc = SpringConfig.fromOrigamiTensionAndFriction(40.0, 7.0)
        let sc2 = SpringConfig.fromBouncinessAndSpeed(2.0, 1.1)
        let sc3 = SpringConfig.coastingConfigWithOrigamiFriction(1.1)
        sc3.hashCode()
        @Assert(sc != sc2, true)
    }

}