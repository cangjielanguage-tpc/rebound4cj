// 3rd_party_lib:rebound4ohos/rebound/src/main/cangjie/build/rebound:rebound4ohos/rebound/src/main/cangjie/build/j2cjlib
// 3rd_party_lib_ohos:cangjie/build/aarch64-linux-ohos/flexSearch4cj


from rebound import rebound.*
from std import math.*
@Test
public class TestSpringCurrentValueIsApproximately{
    /**
        public func currentValueIsApproximately(value: Float64): Bool
    **/
    @TestCase
    func test_Spring_currentValueIsApproximately_01(): Unit {
        var springLooper=SteppingLooper()
        var baseSpringSystem=BaseSpringSystem(springLooper)
        var springOri=baseSpringSystem.createSpring()
        springOri.setCurrentValue(Float64(5345345.53453))
        springOri.setRestDisplacementThreshold(Float64(5345345.53453))
        @Assert(springOri.currentValueIsApproximately(Float64(200)),true)
    }
    @TestCase
    func test_Spring_currentValueIsApproximately_02(): Unit {
        var springLooper=SteppingLooper()
        var baseSpringSystem=BaseSpringSystem(springLooper)
        var springOri=baseSpringSystem.createSpring()
        springOri.setCurrentValue(Float64(-5345345.53453))
        springOri.setRestDisplacementThreshold(Float64(5345345.53453))
        @Assert(springOri.currentValueIsApproximately(Float64(200)),false)
    }
    @TestCase
    func test_Spring_currentValueIsApproximately_03(): Unit {
        var springLooper=SteppingLooper()
        var baseSpringSystem=BaseSpringSystem(springLooper)
        var springOri=baseSpringSystem.createSpring()
        springOri.setCurrentValue(Float64(-5345345.53453))
        springOri.setRestDisplacementThreshold(Float64(0))
        @Assert(springOri.currentValueIsApproximately(Float64(-5345345.53453)),true)
    }
    @TestCase
    func test_Spring_currentValueIsApproximately_04(): Unit {
        var springLooper=SteppingLooper()
        var baseSpringSystem=BaseSpringSystem(springLooper)
        var springOri=baseSpringSystem.createSpring()
        springOri.setCurrentValue(Float64(-5345345.53453))
        springOri.setRestDisplacementThreshold(Float64(0))
        @Assert(springOri.currentValueIsApproximately(Float64(0)),false)
    }
}

