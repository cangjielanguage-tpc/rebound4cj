// 3rd_party_lib:rebound4ohos/rebound/src/main/cangjie/build/rebound:rebound4ohos/rebound/src/main/cangjie/build/j2cjlib
// 3rd_party_lib_ohos:cangjie/build/aarch64-linux-ohos/flexSearch4cj


from rebound import rebound.*
@Test
public class TestSpringSetSpringConfig{
    /**
    public func setSpringConfig(springConfig: ?SpringConfig): Spring
    public func getSpringConfig(): SpringConfig
    **/
    @TestCase
    func test_Spring_setSpringConfig_01(): Unit {
        var springLooper=SteppingLooper()
        var baseSpringSystem=BaseSpringSystem(springLooper)
        var springOri=baseSpringSystem.createSpring()
        var springconfig01=SpringConfig(Float64(7.88),Float64(777777.88))
        springOri.setSpringConfig(springconfig01)
        var springconfigAct=springOri.getSpringConfig()
        @Assert(springconfig01==springconfigAct,true)
        var springconfig02=SpringConfig.fromOrigamiTensionAndFriction(Float64(7.88),Float64(777777.88))
        springOri.setSpringConfig(springconfig02)
        springconfigAct=springOri.getSpringConfig()
        @Assert(springconfig02==springconfigAct,true)
    }
    @TestCase
    func test_Spring_setSpringConfig_02(): Unit {
        var springLooper=SteppingLooper()
        var baseSpringSystem=BaseSpringSystem(springLooper)
        var springOri=baseSpringSystem.createSpring()
        var springconfigAct=springOri.getSpringConfig()
        @Assert(springconfigAct==SpringConfig.defaultConfig,true)
    }
}

