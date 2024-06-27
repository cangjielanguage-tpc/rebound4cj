// 3rd_party_lib:rebound4ohos/rebound/src/main/cangjie/build/rebound:rebound4ohos/rebound/src/main/cangjie/build/j2cjlib
// 3rd_party_lib_ohos:cangjie/build/aarch64-linux-ohos/flexSearch4cj


from rebound import rebound.*
from std import math.*
@Test
public class TestSpringSystemShouldAdvance{
    /**
        public func systemShouldAdvance(): Bool
    **/
    @TestCase
    func test_Spring_systemShouldAdvance_01(): Unit {//true场景造不出来需确认
        var springLooper=SteppingLooper()
        var baseSpringSystem=BaseSpringSystem(springLooper)
        var springOri=baseSpringSystem.createSpring()
        springOri.setCurrentValue(Float64(5345345.53453))
        @Assert(springOri.wasAtRest(),true)
        springOri.setAtRest()
        @Assert(springOri.isAtRest(),true)
        @Assert(springOri.systemShouldAdvance(),false)
    }
    @TestCase
    func test_Spring_systemShouldAdvance_02(): Unit {
        var springLooper=SteppingLooper()
        var baseSpringSystem=BaseSpringSystem(springLooper)
        var springOri=baseSpringSystem.createSpring()
        var springconfig=SpringConfig(Float64(0),Float64(0))
        springOri.setSpringConfig(springconfig)
        springOri.setAtRest()
        springOri.setRestSpeedThreshold(Float64(-18))
        @Assert(springOri.wasAtRest(),true)
        @Assert(springOri.isAtRest(),false)
        @Assert(springOri.systemShouldAdvance(),true)
    }

}

