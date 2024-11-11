// 3rd_party_lib:rebound4cj/rebound/src/main/cangjie/target/release/rebound

import rebound.*
import std.math.*
@Test
public class TestSpringisOvershooting{
    /**
        public func isOvershooting(): Bool
        mSpringConfig.tension > 0
        (mStartValue < mEndValue && getCurrentValue() > mEndValue) || (mStartValue > mEndValue && getCurrentValue() < mEndValue)
    **/
    @TestCase
    func test_Spring_isOvershooting_01(): Unit {
        var springLooper=SteppingLooper()
        var baseSpringSystem=BaseSpringSystem(springLooper)
        var springOri=baseSpringSystem.createSpring()
        springOri.setCurrentValue(Float64(5345345.53453))
        @Assert(springOri.isOvershooting(),false)
    }
}

