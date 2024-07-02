// 3rd_party_lib:rebound4ohos/rebound/src/main/cangjie/build/rebound:rebound4ohos/rebound/src/main/cangjie/build/j2cjlib
// 3rd_party_lib_ohos:cangjie/build/aarch64-linux-ohos/flexSearch4cj


from rebound import rebound.*
@Test
public class TestSpringRestDisplacementThreshold{
    /**
    public func setOvershootClampingEnabled(overshootClampingEnabled: Bool): Spring
    public func isOvershootClampingEnabled(): Bool
    **/
    @TestCase
    func test_Spring_RestDisplacementThreshold_01(): Unit {
        var springLooper=SteppingLooper()
        var baseSpringSystem=BaseSpringSystem(springLooper)
        var springOri=baseSpringSystem.createSpring()
        @Assert(springOri.isOvershootClampingEnabled(),false)
        springOri.setOvershootClampingEnabled(false)
        @Assert(springOri.isOvershootClampingEnabled(),false)
        springOri.setOvershootClampingEnabled(true)
        @Assert(springOri.isOvershootClampingEnabled(),true)
    }
}

