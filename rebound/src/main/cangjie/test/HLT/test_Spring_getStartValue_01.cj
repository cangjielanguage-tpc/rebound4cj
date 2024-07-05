// 3rd_party_lib:rebound4ohos/rebound/src/main/cangjie/build/rebound

from rebound import rebound.*
@Test
public class TestSpringStartValue{
    /**
    public func getStartValue(): Float64
    **/
    @TestCase
    func test_Spring_getStartValue_01(): Unit {
        var springLooper=SteppingLooper()
        var baseSpringSystem=BaseSpringSystem(springLooper)
        var springOri=baseSpringSystem.createSpring()
        springOri.setCurrentValue(Float64(5345345.53453))
        @Assert(springOri.getStartValue(),Float64(5345345.53453))
    }

}

