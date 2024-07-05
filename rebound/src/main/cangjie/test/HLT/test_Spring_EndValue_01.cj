// 3rd_party_lib:rebound4ohos/rebound/src/main/cangjie/build/rebound

from rebound import rebound.*
@Test
public class TestSpringSetSpringConfig{
    /**
    public func setEndValue(endValue: Float64): Spring
    public func getEndValue(): Float64
    **/
    @TestCase
    func test_Spring_getEndValue_01(): Unit {
        var springLooper=SteppingLooper()
        var baseSpringSystem=BaseSpringSystem(springLooper)
        var springOri=baseSpringSystem.createSpring()
        springOri.setEndValue(Float64(5345345.53453))
        @Assert(springOri.getEndValue(),Float64(5345345.53453))
        springOri.setEndValue(Float64(-5345345.53453))
        @Assert(springOri.getEndValue(),Float64(-5345345.53453))
         springOri.setEndValue(Float64(0))
        @Assert(springOri.getEndValue(),Float64(0))
    }
}

