// EXEC: cjc %import-path %L %l %f
// EXEC: ./main

import std.unittest.*
import std.unittest.testmacro.*
import std.collection.*
import rebound.rebound.*

main(): Int64 {
    var test = TestReadme01()
    test.execute()
    test.printResult()
    return 0
}

@Test
public class TestReadme01 {

    @TestCase
    public func test01(): Unit {
        let bss: BaseSpringSystem = BaseSpringSystem(SteppingLooper())
        let s: Spring = bss.createSpring()
        s.setSpringConfig(SpringConfig.defaultConfig)
        let lis: MySpringSystemListener3 = MySpringSystemListener3()
        s.addListener(lis)
        s.setEndValue(10.0)
    }
}

class MySpringSystemListener3 <: SimpleSpringListener {

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