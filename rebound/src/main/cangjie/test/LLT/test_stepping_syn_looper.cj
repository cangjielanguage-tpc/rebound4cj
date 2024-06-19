// EXEC: cjc %import-path %L %l %f
// EXEC: ./main

from std import unittest.*
from std import unittest.testmacro.*
from std import collection.*
from rebound import rebound.*

main(): Int64 {
    var test = TestSteppingLooper()
    test.test01()
    test.test02()
    test.test03()
    test.test04()
    test.test05()
    test.test06()
    return 0
}

@Test
public class TestSteppingLooper {

    @TestCase
    public func test01(): Unit {
        let sl = SteppingLooper()
        sl.start()
        let flag = sl.step(1)
        sl.stop()
        @Assert(flag, false)
    }

    @TestCase
    public func test02(): Unit {
        let sl = SteppingLooper()
        sl.start()
        let flag = sl.step(0)
        sl.stop()
        @Assert(flag, false)
    }

    @TestCase
    public func test03(): Unit {
        let sl = SynchronousLooper()
        let v1 = sl.getTimeStep()
        @Assert(v1, 16.666700)
        sl.setTimeStep(10.000000)
        let v2 = sl.getTimeStep()
        @Assert(v2, 10.0)
        sl.start()
        sl.stop()
    }

    @TestCase
    public func test04(): Unit {
        let sl = SteppingLooper()
        sl.stop()
    }

    @TestCase
    public func test05(): Unit {
        let sl = SteppingLooper()
        sl.start()
        sl.stop()
    }

    @TestCase
    public func test06(): Unit {
        let sl = SynchronousLooper()
        let v1 = sl.getTimeStep()
        @Assert(v1, 16.666700)
        sl.start()
        sl.stop()
    }

}