// 3rd_party_lib:rebound4ohos/rebound/src/main/cangjie/build/rebound

from rebound import rebound.*
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