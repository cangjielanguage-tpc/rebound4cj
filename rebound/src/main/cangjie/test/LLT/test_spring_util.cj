// EXEC: cjc %import-path %L %l %f
// EXEC: ./main

from std import unittest.*
from std import unittest.testmacro.*
from std import collection.*
from rebound import rebound.*

main(): Int64 {
    var test = TestSpringUtil()
    test.test01()
    test.test02()
    return 0
}

@Test
public class TestSpringUtil {

    @TestCase
    public func test01(): Unit {
        let su = SpringUtil.mapValueFromRangeToRange(10.0, 1.0, 2.0, 3.0, 4.0)
        @Assert(su, 12.000000)
    }

    @TestCase
    public func test02(): Unit {
        let su = SpringUtil.clamp(10.0, 1.0, 2.0)
        @Assert(su, 2.000000)
    }

}