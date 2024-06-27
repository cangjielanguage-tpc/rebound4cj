// 3rd_party_lib:rebound4ohos/rebound/src/main/cangjie/build/rebound:rebound4ohos/rebound/src/main/cangjie/build/j2cjlib
// 3rd_party_lib_ohos:cangjie/build/aarch64-linux-ohos/flexSearch4cj


from rebound import rebound.*
from std import math.*
@Test
public class TestSpringAtRest{
    /**
    public func wasAtRest(): Bool
    public func isAtRest(): Bool
    public func setAtRest(): Spring
    **/
    @TestCase
    func test_Spring_wasAtRest_01(): Unit {
        var springLooper=SteppingLooper()
        var baseSpringSystem=BaseSpringSystem(springLooper)
        var springOri=baseSpringSystem.createSpring()
        springOri.setCurrentValue(Float64(5345345.53453))
        @Assert(springOri.wasAtRest(),true)
    }
    @TestCase
    func test_Spring_isAtRest_03(): Unit {
        var springLooper=SteppingLooper()
        var baseSpringSystem=BaseSpringSystem(springLooper)
        var springOri=baseSpringSystem.createSpring()
        var springconfig=SpringConfig(Float64(0),Float64(0))
        springOri.setSpringConfig(springconfig)
        springOri.setAtRest()
        springOri.setRestSpeedThreshold(Float64(18))
        @Assert(springOri.isAtRest(),true)
    }
    @TestCase
    func test_Spring_isAtRest_04(): Unit {
        var springLooper=SteppingLooper()
        var baseSpringSystem=BaseSpringSystem(springLooper)
        var springOri=baseSpringSystem.createSpring()
        var springconfig=SpringConfig(Float64(0),Float64(0))
        springOri.setSpringConfig(springconfig)
        springOri.setAtRest()
        springOri.setRestSpeedThreshold(Float64(-18))
        @Assert(springOri.isAtRest(),false)
    }
    @TestCase
    func test_Spring_setAtRest_05(): Unit {
        var springLooper=SteppingLooper()
        var baseSpringSystem=BaseSpringSystem(springLooper)
        var springOri=baseSpringSystem.createSpring()
        springOri.setVelocity(Float64(2.3))
        @Assert(springOri.getVelocity(),Float64(2.3))
        springOri.setAtRest()
        @Assert(springOri.getVelocity(),Float64(0))
        springOri.setAtRest()
        @Assert(springOri.getVelocity(),Float64(0))
    }
}

