// 3rd_party_lib:rebound4cj/rebound/src/main/cangjie/target/release/rebound

import rebound.*
@Test
public class TestSpringRestSpeedThreshold{
    /**
    public func setRestSpeedThreshold(restSpeedThreshold: Float64): Spring
    public func getRestSpeedThreshold(): Float64
    **/
    @TestCase
    func test_Spring_RestSpeedThreshold_01(): Unit {
        var springLooper=SteppingLooper()
        var baseSpringSystem=BaseSpringSystem(springLooper)
        var springOri=baseSpringSystem.createSpring()
        springOri.setRestSpeedThreshold(Float64(5345345.53453))
        @Assert(springOri.getRestSpeedThreshold(),Float64(5345345.53453))
        springOri.setRestSpeedThreshold(Float64(-5345345.53453))
        @Assert(springOri.getRestSpeedThreshold(),Float64(-5345345.53453))
         springOri.setRestSpeedThreshold(Float64(0))
        @Assert(springOri.getRestSpeedThreshold(),Float64(0))
    }
}

