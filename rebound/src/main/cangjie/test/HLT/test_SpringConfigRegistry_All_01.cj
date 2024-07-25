// 3rd_party_lib:rebound4ohos/rebound/src/main/cangjie/build/rebound

import rebound.rebound.*
@Test
public class TestSpringConfigRegistry{
     @TestCase
    func test_SpringConfigRegistry_addSpringConfig_01(): Unit {
        var springconfigregistry=SpringConfigRegistry.getInstance()
        var springconfig=SpringConfig(Float64(7.88),Float64(777777.88))
        @Assert(springconfigregistry.addSpringConfig(springconfig,"springconfig01"),true)
        @Assert(springconfigregistry.addSpringConfig(springconfig,"springconfig01"),false)
        @Assert(springconfigregistry.addSpringConfig(springconfig,"springconfig02"),false)
        var springconfig02=SpringConfig(Float64(8.88),Float64(9.88))
        @Assert(springconfigregistry.addSpringConfig(springconfig02,"springconfig01"),true)
        var springconfig03=SpringConfig(Float64(8.88),Float64(9.88))
        @Assert(springconfigregistry.addSpringConfig(springconfig03,""),true)
    }
}

