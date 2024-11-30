// 3rd_party_lib:rebound4cj/rebound/src/main/cangjie/target/release/rebound

import rebound.*
@Test
public class TestBaseSpringSystemGetIsIdle{
    /******public func getIsIdle(): Bool*****/
    @TestCase
    func test_BaseSpringSystem_getIsIdle_01(): Unit {
        var springLooper=SteppingLooper()
        var baseSpringSystem=BaseSpringSystem(springLooper)
        @Assert(baseSpringSystem.getIsIdle(),true)
    }
}