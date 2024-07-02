// 3rd_party_lib:rebound4ohos/rebound/src/main/cangjie/build/rebound:rebound4ohos/rebound/src/main/cangjie/build/j2cjlib
// 3rd_party_lib_ohos:cangjie/build/aarch64-linux-ohos/flexSearch4cj


from rebound import rebound.*
@Test
public class TestSpringOperator{
    /**
    public operator func ==(other: Spring): Bool
    public operator func !=(other: Spring): Bool
    public override func hashCode(): Int64
    **/
    @TestCase
    func test_Spring_operator_01(): Unit {
        var springLooper=SteppingLooper()
        var baseSpringSystem=BaseSpringSystem(springLooper)
        var springOri01=baseSpringSystem.createSpring()
        var springOri02=baseSpringSystem.createSpring()
        @Assert(springOri01==springOri02,false)
        @Assert(springOri01!=springOri02,true)
        @Assert(springOri01.hashCode(),Int64(-7552812593272022626))
    }
}

