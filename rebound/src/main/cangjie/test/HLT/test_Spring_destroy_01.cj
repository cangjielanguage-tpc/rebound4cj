// 3rd_party_lib:rebound4ohos/rebound/src/main/cangjie/build/rebound:rebound4ohos/rebound/src/main/cangjie/build/j2cjlib
// 3rd_party_lib_ohos:cangjie/build/aarch64-linux-ohos/flexSearch4cj


from rebound import rebound.*
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

