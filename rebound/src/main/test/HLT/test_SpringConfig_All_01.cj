// 3rd_party_lib:rebound4cj/rebound/src/main/cangjie/target/release/rebound

import rebound.*
@Test
public class TestSpringConfig{
    /**
    public class SpringConfig
    public init(tension: Float64, friction: Float64)
    public static func fromOrigamiTensionAndFriction(qcTension: Float64, qcFriction: Float64): SpringConfig
    public static func fromBouncinessAndSpeed(bounciness: Float64, speed: Float64): SpringConfig
    public static func coastingConfigWithOrigamiFriction(friction: Float64): SpringConfig

    public operator func ==(other: SpringConfig): Bool
    public operator func !=(other: SpringConfig): Bool
    public override func hashCode(): Int64
    **/
    @TestCase
    func test_SpringConfig_Init_01(): Unit {
        var springconfig01=SpringConfig(Float64(7.88),Float64(777777.88))
        var springconfig02=SpringConfig.fromOrigamiTensionAndFriction(Float64(7.88),Float64(777777.88))
        var springconfig03=SpringConfig.fromBouncinessAndSpeed(Float64(7.88),Float64(777777.88))
        var springconfig04=SpringConfig.coastingConfigWithOrigamiFriction(Float64(7.88))
        @Assert(springconfig01==springconfig02,false)
        @Assert(springconfig01==springconfig03,false)
        @Assert(springconfig03==springconfig02,false)
        @Assert(springconfig03==springconfig04,false)

        @Assert(springconfig01.hashCode(),-1936239692935844904)
        @Assert(springconfig02.hashCode(),3100500623545002874)
        @Assert(springconfig03.hashCode(),1721818269266705121)
        @Assert(springconfig04.hashCode(),-7997467308878406948)
    }
    @TestCase
    func test_SpringConfig_Init_02(): Unit {
        var springconfig01=SpringConfig(Float64(-7.88),Float64(-777777.88))
        var springconfig02=SpringConfig.fromOrigamiTensionAndFriction(Float64(-7.88),Float64(-777777.88))
        var springconfig03=SpringConfig.fromBouncinessAndSpeed(Float64(-7.88),Float64(-777777.88))
        var springconfig04=SpringConfig.coastingConfigWithOrigamiFriction(Float64(-7.88))
        @Assert(springconfig01==springconfig02,false)
        @Assert(springconfig01==springconfig03,false)
        @Assert(springconfig03==springconfig02,false)
        @Assert(springconfig03==springconfig04,false)

        @Assert(springconfig01.hashCode(),3020141636932547916)
        @Assert(springconfig02.hashCode(),9064820564048539055)
        @Assert(springconfig03.hashCode(),5991653718733068936)
        @Assert(springconfig04.hashCode(),-944997399625326657)
    }
    @TestCase
    func test_SpringConfig_Init_03(): Unit {
        var springconfig01=SpringConfig(Float64(0),Float64(0))
        var springconfig02=SpringConfig.fromOrigamiTensionAndFriction(Float64(0),Float64(0))
        var springconfig03=SpringConfig.fromBouncinessAndSpeed(Float64(0),Float64(0))
        var springconfig04=SpringConfig.coastingConfigWithOrigamiFriction(Float64(0))
        @Assert(springconfig01==springconfig02,false)
        @Assert(springconfig01==springconfig03,false)
        @Assert(springconfig03==springconfig02,false)
        @Assert(springconfig03==springconfig04,false)

        @Assert(springconfig01.hashCode(),2662615379955030116)
        @Assert(springconfig02.hashCode(),2662615379955030116)
        @Assert(springconfig03.hashCode(),-3047863601884649061)
        @Assert(springconfig04.hashCode(),2662615379955030116)
    }
}

