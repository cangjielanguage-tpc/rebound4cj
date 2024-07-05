// 3rd_party_lib:rebound4ohos/rebound/src/main/cangjie/build/rebound

from rebound import rebound.*
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
    func test_SpringConfigRegistry_removeSpringConfig_02(): Unit {
        var springconfigregistry=SpringConfigRegistry.getInstance()
        var springconfig=SpringConfig(Float64(7.88),Float64(777777.88))
        @Assert(springconfigregistry.addSpringConfig(springconfig,"springconfig01"),true)
        @Assert(springconfigregistry.removeSpringConfig(springconfig),true)
        @Assert(springconfigregistry.removeSpringConfig(springconfig),false)
    }
}

