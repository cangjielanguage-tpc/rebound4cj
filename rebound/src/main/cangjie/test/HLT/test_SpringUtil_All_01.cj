// 3rd_party_lib:rebound4ohos/rebound/src/main/cangjie/build/rebound:rebound4ohos/rebound/src/main/cangjie/build/j2cjlib
// 3rd_party_lib_ohos:cangjie/build/aarch64-linux-ohos/flexSearch4cj


from std import math.*
from rebound import rebound.*
@Test
public class TestSpringUtil{
    /**
    public class SpringUtil
    public static func mapValueFromRangeToRange(value: Float64, fromLow: Float64, fromHigh: Float64, toLow: Float64, toHigh: Float64): Float64
    public static func clamp(value: Float64, low: Float64, high: Float64): Float64
    **/
    @TestCase
    func test_SpringUtil_mapValueFromRangeToRange_01(): Unit {
        @Assert(SpringUtil.mapValueFromRangeToRange(Float64(1.1255),Float64(45.665),Float64(123454.221),Float64(0.3221),Float64(9.2131)),Float64(0.3188911406847674))
    }
    @TestCase
    func test_SpringUtil_mapValueFromRangeToRange_02(): Unit {
        @Assert(SpringUtil.mapValueFromRangeToRange(Float64(-1.1255),Float64(-45.665),Float64(-123454.221),Float64(-0.3221),Float64(-9.2131)),Float64(-0.3188911406847674))
    }
    @TestCase
    func test_SpringUtil_mapValueFromRangeToRange_03(): Unit {
        @Assert(SpringUtil.mapValueFromRangeToRange(Float64(0),Float64(0),Float64(0),Float64(0),Float64(0)).isNaN(),true)
    }
    @TestCase
    func test_SpringUtil_clamp_01(): Unit {
        @Assert(SpringUtil.clamp(Float64(1.1255),Float64(45.665),Float64(123454.221)),Float64(45.665))
    }
    @TestCase
    func test_SpringUtil_clamp_02(): Unit {
        @Assert(SpringUtil.clamp(Float64(-1.1255),Float64(-45.665),Float64(-123454.221)),Float64(-123454.221))
    }
    @TestCase
    func test_SpringUtil_clamp_03(): Unit {
        @Assert(SpringUtil.clamp(Float64(0),Float64(0),Float64(0)),Float64(0.0))
    }
}