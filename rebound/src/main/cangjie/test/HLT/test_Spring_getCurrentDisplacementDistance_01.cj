// 3rd_party_lib:rebound4ohos/rebound/src/main/cangjie/build/rebound:rebound4ohos/rebound/src/main/cangjie/build/j2cjlib
// 3rd_party_lib_ohos:cangjie/build/aarch64-linux-ohos/flexSearch4cj


from rebound import rebound.*
from std import math.*
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

