// 3rd_party_lib:rebound4cj/rebound/src/main/cangjie/target/release/rebound

import rebound.*
@Test
public class TestSpringSetSpringConfig{
    /**
    public func getId(): String
    **/
    @TestCase
    func test_Spring_getId_01(): Unit {
        var springLooper=SteppingLooper()
        var baseSpringSystem=BaseSpringSystem(springLooper)
        var springOri01=baseSpringSystem.createSpring()
        @Assert(springOri01.getId(),"spring:0")
        var springOri02=baseSpringSystem.createSpring()
        @Assert(springOri02.getId(),"spring:1")
        var springOri03=baseSpringSystem.createSpring()
        @Assert(springOri03.getId(),"spring:2")
    }
}

