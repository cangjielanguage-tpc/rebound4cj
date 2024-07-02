// 3rd_party_lib:rebound4ohos/rebound/src/main/cangjie/build/rebound:rebound4ohos/rebound/src/main/cangjie/build/j2cjlib
// 3rd_party_lib_ohos:cangjie/build/aarch64-linux-ohos/flexSearch4cj


from rebound import rebound.*
from std import collection.*
@Test
public class TestBaseSpringSystemGetAllSprings{
    /******public func getAllSprings(): ArrayList<Spring>*****/
    @TestCase
    func test_BaseSpringSystem_getAllSprings_01(): Unit {
        var springLooper=SteppingLooper()
        var baseSpringSystem=BaseSpringSystem(springLooper)
        @Assert(baseSpringSystem.getAllSprings(),ArrayList<Spring>())
    }
    @TestCase
    func test_BaseSpringSystem_getAllSprings_02(): Unit {
        var springLooper=SteppingLooper()
        var baseSpringSystem=BaseSpringSystem(springLooper)
        var springOri=baseSpringSystem.createSpring()
        @Assert(baseSpringSystem.getAllSprings(),ArrayList<Spring>([springOri]))

    }
    @TestCase
    func test_BaseSpringSystem_getAllSprings_03(): Unit {
        var springLooper=SteppingLooper()
        var baseSpringSystem=BaseSpringSystem(springLooper)
        var springOris=ArrayList<Spring>()
        for(_ in 0..10){
            var spring=baseSpringSystem.createSpring()
            springOris.append(spring)
        }
        var springActs=baseSpringSystem.getAllSprings()
        for(index in 0..10){
           @Assert(springOris[index].getId(),springActs[index].getId())
        }
    }
}