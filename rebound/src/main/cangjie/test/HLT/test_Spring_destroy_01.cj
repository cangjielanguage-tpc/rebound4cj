// 3rd_party_lib:rebound4cj/rebound/src/main/cangjie/target/release/rebound

import rebound.*
@Test
public class TestSpringSetSpringConfig{
    /**
    public func destroy(): Unit
    **/
    @TestCase
    func test_Spring_destroy_01(): Unit {
        var springLooper=SteppingLooper()
        var baseSpringSystem=BaseSpringSystem(springLooper)
        var springOri01=baseSpringSystem.createSpring()
        @Assert(baseSpringSystem.getAllSprings().size,1)
        springOri01.destroy()
        @Assert(baseSpringSystem.getAllSprings().size,0)
    }
}

