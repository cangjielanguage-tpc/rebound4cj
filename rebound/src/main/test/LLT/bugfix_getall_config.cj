// EXEC: cjc %import-path %L %l %f
// EXEC: ./main

import std.unittest.*
import std.unittest.testmacro.*
import std.collection.*
import rebound.*

main(): Int64 {
    var test = BugfixGetAllSpringConfig()
    test.test_SpringConfigRegistry_addSpringConfig_01()
    test.test_SpringConfigRegistry_getAllSpringConfig_03()
    return 0
}

@Test
public class BugfixGetAllSpringConfig {

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
    @TestCase
    func test_SpringConfigRegistry_getAllSpringConfig_03(): Unit {
        var springconfigregistry=SpringConfigRegistry.getInstance()
        var springconfig=SpringConfig(Float64(7.88),Float64(777777.88))
        @Assert(springconfigregistry.addSpringConfig(springconfig,"springconfig01"),true)
        @Assert(springconfigregistry.getAllSpringConfig().size,5)
        var springconfig02=SpringConfig(Float64(8.88),Float64(9.88))
        @Assert(springconfigregistry.addSpringConfig(springconfig02,"springconfig02"),true)
        var springconfig03=SpringConfig(Float64(6.88),Float64(6.88))
        @Assert(springconfigregistry.addSpringConfig(springconfig03,"springconfig03"),true)
        @Assert(springconfigregistry.getAllSpringConfig().size,7)
    }
}