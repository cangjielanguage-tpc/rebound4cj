// 3rd_party_lib:rebound4cj/rebound/src/main/cangjie/target/release/rebound

import rebound.*
import std.math.*
@Test
public class TestSpringStartValue{
    /**
    public func getCurrentDisplacementDistance(): Float64
    **/
    @TestCase
    func test_Spring_getStartValue_01(): Unit {
        var springLooper=SteppingLooper()
        var baseSpringSystem=BaseSpringSystem(springLooper)
        var springOri=baseSpringSystem.createSpring()
        springOri.setCurrentValue(Float64(5345345.53453))
        var endValue=springOri.getEndValue()
        @Assert(springOri.getCurrentDisplacementDistance(),abs(endValue-Float64(5345345.53453)))
    }
}

