// EXEC: cjc %import-path %L %l %f
// EXEC: ./main

import std.unittest.*
import std.unittest.testmacro.*
import std.collection.*
import rebound.*

main(): Int64 {
    var test = TestSimpleSpringListener()
    test.test01()
    return 0
}

@Test
public class TestSimpleSpringListener {

    @TestCase
    public func test01(): Unit {
        let bss: BaseSpringSystem = BaseSpringSystem(SteppingLooper())
        let s: Spring = bss.createSpring()
        let msl = MySimpleSpringListener()
        msl.onSpringUpdate(s)
        msl.onSpringAtRest(s)
        msl.onSpringActivate(s)
        msl.onSpringEndStateChange(s)
    }

}

class MySimpleSpringListener <: SimpleSpringListener {

    var str = ""

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