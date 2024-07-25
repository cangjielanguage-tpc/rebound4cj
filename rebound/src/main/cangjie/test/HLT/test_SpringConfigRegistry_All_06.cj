// 3rd_party_lib:rebound4ohos/rebound/src/main/cangjie/build/rebound

import rebound.rebound.*
@Test
public class TestSpringConfigRegistry{
    /**
    public class SpringConfigRegistry
    public static func getInstance(): SpringConfigRegistry
    public func addSpringConfig(springConfig: ?SpringConfig, configName: ?String): Bool
    public func removeSpringConfig(springConfig: ?SpringConfig): Bool
    public func getAllSpringConfig(): Map<SpringConfig, String>
    public func removeAllSpringConfig(): Unit
    **/
    @TestCase
    func test_SpringConfigRegistry_removeAllSpringConfig_06(): Unit {
        var springconfigregistry=SpringConfigRegistry.getInstance()
        var springconfig=SpringConfig(Float64(7.88),Float64(777777.88))
        @Assert(springconfigregistry.addSpringConfig(springconfig,"springconfig01"),true)
        @Assert(springconfigregistry.getAllSpringConfig().size,2)
        var springconfig02=SpringConfig(Float64(8.88),Float64(9.88))
        @Assert(springconfigregistry.addSpringConfig(springconfig02,"springconfig02"),true)
        var springconfig03=SpringConfig(Float64(6.88),Float64(6.88))
        @Assert(springconfigregistry.addSpringConfig(springconfig03,"springconfig03"),true)
        @Assert(springconfigregistry.getAllSpringConfig().size,4)
        springconfigregistry.removeAllSpringConfig()
        @Assert(springconfigregistry.getAllSpringConfig().size,0)
    }
}

