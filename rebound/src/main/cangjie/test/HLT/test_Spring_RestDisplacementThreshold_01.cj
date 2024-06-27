// 3rd_party_lib:rebound4ohos/rebound/src/main/cangjie/build/rebound:rebound4ohos/rebound/src/main/cangjie/build/j2cjlib
// 3rd_party_lib_ohos:cangjie/build/aarch64-linux-ohos/flexSearch4cj


from rebound import rebound.*
@Test
public class TestSpringRestDisplacementThreshold{
    /**
    public func setRestDisplacementThreshold(displacementFromRestThreshold: Float64): Spring
    public func getRestDisplacementThreshold(): Float64
    **/
    @TestCase
    func test_Spring_RestDisplacementThreshold_01(): Unit {
        var springLooper=SteppingLooper()
        var baseSpringSystem=BaseSpringSystem(springLooper)
        var springOri=baseSpringSystem.createSpring()
        springOri.setRestDisplacementThreshold(Float64(5345345.53453))
        @Assert(springOri.getRestDisplacementThreshold(),Float64(5345345.53453))
        springOri.setRestDisplacementThreshold(Float64(-5345345.53453))
        @Assert(springOri.getRestDisplacementThreshold(),Float64(-5345345.53453))
         springOri.setRestDisplacementThreshold(Float64(0))
        @Assert(springOri.getRestDisplacementThreshold(),Float64(0))
    }
}

