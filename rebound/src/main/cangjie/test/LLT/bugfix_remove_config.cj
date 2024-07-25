// EXEC: cjc %import-path %L %l %f
// EXEC: ./main

import std.unittest.*
import std.unittest.testmacro.*
import std.collection.*
import rebound.rebound.*

main(): Int64 {
    var test = BugfixSpringConfigRegistry()
    test.test01()
    return 0
}

@Test
public class BugfixSpringConfigRegistry {

    @TestCase
    public func test01(): Unit {
        var springconfigregistry=SpringConfigRegistry.getInstance()
        var springconfig=SpringConfig(Float64(7.88),Float64(777777.88))
        @Assert(springconfigregistry.addSpringConfig(springconfig,"springconfig01"),true)
        @Assert(springconfigregistry.removeSpringConfig(springconfig),true)
        @Assert(springconfigregistry.removeSpringConfig(springconfig),false)
    }

}