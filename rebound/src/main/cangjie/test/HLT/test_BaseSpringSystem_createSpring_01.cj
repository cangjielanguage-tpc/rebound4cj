// 3rd_party_lib:rebound4ohos/rebound/src/main/cangjie/build/rebound:rebound4ohos/rebound/src/main/cangjie/build/j2cjlib
// 3rd_party_lib_ohos:cangjie/build/aarch64-linux-ohos/flexSearch4cj


from rebound import rebound.*
from std import collection.*
@Test
public class TestBaseSpringSystemCreateSpring{
    /******public func createSpring(): Spring*****/
    @TestCase
    func test_BaseSpringSystem_createSpring_01(): Unit {
        var springLooper=SteppingLooper()
        var baseSpringSystem=BaseSpringSystem(springLooper)
        var springOri=baseSpringSystem.createSpring()
        var springAct=baseSpringSystem.getSpringById(springOri.getId()).getOrThrow()
        @Assert(springOri.getId(),springAct.getId())
    }
    @TestCase
    func test_BaseSpringSystem_createSpring_02(): Unit {
        var springLooper=SteppingLooper()
        var baseSpringSystem=BaseSpringSystem(springLooper)
        var springOris=ArrayList<Spring>()
        var springActs=ArrayList<Spring>()
        for(_ in 0..10){
            var spring=baseSpringSystem.createSpring()
            springOris.append(spring)
            springActs.append(baseSpringSystem.getSpringById(spring.getId()).getOrThrow())
        }
        for(index in 0..10){
           @Assert(springOris[index].getId(),springActs[index].getId())
        }
    }
}