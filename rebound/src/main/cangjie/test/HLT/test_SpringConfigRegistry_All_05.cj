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
    func test_SpringConfigRegistry_removeAllSpringConfig_05(): Unit {
        var springconfigregistry=SpringConfigRegistry.getInstance()
        springconfigregistry.removeAllSpringConfig()
        @Assert(springconfigregistry.getAllSpringConfig().size,0)
    }
}

