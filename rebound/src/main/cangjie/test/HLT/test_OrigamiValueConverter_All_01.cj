// 3rd_party_lib:rebound4ohos/rebound/src/main/cangjie/build/rebound

import rebound.rebound.*
@Test
public class TestOrigamiValueConverter{
    /**
    public class OrigamiValueConverter
    public static func tensionFromOrigamiValue(oValue: Float64): Float64
    public static func origamiValueFromTension(tension: Float64): Float64
    public static func frictionFromOrigamiValue(oValue: Float64): Float64
    public static func origamiValueFromFriction(friction: Float64): Float64
    **/
    @TestCase
    func test_OrigamiValueConverter_tensionFromOrigamiValue_01(): Unit {
        @Assert(OrigamiValueConverter.tensionFromOrigamiValue(Float64(0)),Float64(0))
        @Assert(OrigamiValueConverter.tensionFromOrigamiValue(Float64(-1)),Float64(81.78))
        @Assert(OrigamiValueConverter.tensionFromOrigamiValue(Float64(25)),Float64(175.9))
        @Assert(OrigamiValueConverter.tensionFromOrigamiValue(Float64(30)),Float64(194.0))
        @Assert(OrigamiValueConverter.tensionFromOrigamiValue(Float64(36)),Float64(215.72))
    }
    @TestCase
    func test_OrigamiValueConverter_origamiValueFromTension_02(): Unit {
        @Assert(OrigamiValueConverter.origamiValueFromTension(Float64(0)),Float64(0))
        @Assert(OrigamiValueConverter.origamiValueFromTension(Float64(-1)),Float64(-23.867403314917127))
        @Assert(OrigamiValueConverter.origamiValueFromTension(Float64(193)),Float64(29.723756906077348))
        @Assert(OrigamiValueConverter.origamiValueFromTension(Float64(194)),Float64(30.0))
        @Assert(OrigamiValueConverter.origamiValueFromTension(Float64(195)),Float64(30.276243093922652))
    }
    @TestCase
    func test_OrigamiValueConverter_frictionFromOrigamiValue_03(): Unit {
        @Assert(OrigamiValueConverter.frictionFromOrigamiValue(Float64(0)),Float64(0.0))
        @Assert(OrigamiValueConverter.frictionFromOrigamiValue(Float64(-1)),Float64(-2.0))
        @Assert(OrigamiValueConverter.frictionFromOrigamiValue(Float64(7)),Float64(22.0))
        @Assert(OrigamiValueConverter.frictionFromOrigamiValue(Float64(8)),Float64(25.0))
        @Assert(OrigamiValueConverter.frictionFromOrigamiValue(Float64(9)),Float64(28.0))
    }
    @TestCase
    func test_OrigamiValueConverter_origamiValueFromFriction_04(): Unit {
        @Assert(OrigamiValueConverter.origamiValueFromFriction(Float64(0)),Float64(0.0))
        @Assert(OrigamiValueConverter.origamiValueFromFriction(Float64(-1)),Float64(-0.6666666666666661))
        @Assert(OrigamiValueConverter.origamiValueFromFriction(Float64(24)),Float64(7.666666666666667))
        @Assert(OrigamiValueConverter.origamiValueFromFriction(Float64(25)),Float64(8.0))
        @Assert(OrigamiValueConverter.origamiValueFromFriction(Float64(26)),Float64(8.333333333333334))
    }
}

