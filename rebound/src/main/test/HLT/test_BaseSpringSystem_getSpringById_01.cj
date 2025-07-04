// 3rd_party_lib:rebound4cj/rebound/src/main/cangjie/target/release/rebound

import rebound.*
@Test
public class TestBaseSpringSystemGetSpringById{
    /******public func getSpringById(id: ?String): ?Spring*****/
    @TestCase
    func test_BaseSpringSystem_getSpringById_01(): Unit {
        var springLooper=SteppingLooper()
        var baseSpringSystem=BaseSpringSystem(springLooper)
        var springOri=baseSpringSystem.createSpring()
        @Assert(baseSpringSystem.getSpringById(springOri.getId()).getOrThrow().getId(),springOri.getId())
    }
    @TestCase
    func test_BaseSpringSystem_getSpringById_02(): Unit {
        var springLooper=SteppingLooper()
        var baseSpringSystem=BaseSpringSystem(springLooper)
        var springOri=baseSpringSystem.createSpring()
        baseSpringSystem.createSpring()
        baseSpringSystem.createSpring()
        baseSpringSystem.createSpring()
        baseSpringSystem.createSpring()
        @Assert(baseSpringSystem.getSpringById(springOri.getId()).getOrThrow().getId(),springOri.getId())
    }
    @TestCase
    func test_BaseSpringSystem_getSpringById_03(): Unit {
        var springLooper=SteppingLooper()
        var baseSpringSystem=BaseSpringSystem(springLooper)
        @Assert(baseSpringSystem.getSpringById("spring:1").isNone(),true)
    }
}