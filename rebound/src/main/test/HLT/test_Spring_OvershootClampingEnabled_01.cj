// 3rd_party_lib:rebound4cj/rebound/src/main/cangjie/target/release/rebound

import rebound.*
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

