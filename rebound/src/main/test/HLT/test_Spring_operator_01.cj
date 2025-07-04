// 3rd_party_lib:rebound4cj/rebound/src/main/cangjie/target/release/rebound

import rebound.*
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

