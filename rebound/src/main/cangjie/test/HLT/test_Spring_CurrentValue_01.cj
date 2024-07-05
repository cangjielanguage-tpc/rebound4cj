// 3rd_party_lib:rebound4ohos/rebound/src/main/cangjie/build/rebound

from rebound import rebound.*
@Test
public class TestSpringCurrentValue{
    /**
    public func setCurrentValue(currentValue: Float64): Spring
    public func setCurrentValue(currentValue: Float64, atRest: Bool): Spring
    public func getCurrentValue(): Float64
    **/
    @TestCase
    func test_Spring_setCurrentValue_01(): Unit {
        var springLooper=SteppingLooper()
        var baseSpringSystem=BaseSpringSystem(springLooper)
        var springOri=baseSpringSystem.createSpring()
        springOri.setCurrentValue(Float64(5345345.53453))
        @Assert(springOri.getCurrentValue(),Float64(5345345.53453))
        springOri.setCurrentValue(Float64(-5345345.53453))
        @Assert(springOri.getCurrentValue(),Float64(-5345345.53453))
         springOri.setCurrentValue(Float64(0))
        @Assert(springOri.getCurrentValue(),Float64(0))
    }
    @TestCase
    func test_Spring_setCurrentValue_02(): Unit {
        var springLooper=SteppingLooper()
        var baseSpringSystem=BaseSpringSystem(springLooper)
        var springOri=baseSpringSystem.createSpring()
        var listeners01=SubSpringListener()
        springOri.addListener(listeners01)
        springOri.setCurrentValue(Float64(5345345.53453),false)
        @Assert(listeners01.getFlag(),"onSpringUpdate")
        @Assert(springOri.getCurrentValue(),Float64(5345345.53453))
    }
    @TestCase
    func test_Spring_setCurrentValue_03(): Unit {
        var springLooper=SteppingLooper()
        var baseSpringSystem=BaseSpringSystem(springLooper)
        var springOri=baseSpringSystem.createSpring()
        var listeners01=SubSpringListener()
        springOri.addListener(listeners01)
        springOri.setCurrentValue(Float64(5345345.53453),true)
        @Assert(listeners01.getFlag(),"onSpringUpdateonSpringUpdate")
        @Assert(springOri.getVelocity(),Float64(0))
        @Assert(springOri.getCurrentValue(),Float64(5345345.53453))
    }
    @TestCase
    func test_Spring_setCurrentValue_04(): Unit {
        var springLooper=SteppingLooper()
        var baseSpringSystem=BaseSpringSystem(springLooper)
        var springOri=baseSpringSystem.createSpring()
        var listeners01=SubSpringListener()
        springOri.addListener(listeners01)
        springOri.setCurrentValue(Float64(5345345.53453))
        @Assert(listeners01.getFlag(),"onSpringUpdateonSpringUpdateonSpringUpdate")
        @Assert(springOri.getVelocity(),Float64(0))
        @Assert(springOri.getCurrentValue(),Float64(5345345.53453))
    }
    @TestCase
    func test_Spring_setCurrentValue_05(): Unit {
        var springLooper=SteppingLooper()
        var baseSpringSystem=BaseSpringSystem(springLooper)
        var springOri=baseSpringSystem.createSpring()
        var listeners01=SubSpringListener()
        springOri.addListener(listeners01)
        springOri.setCurrentValue(Float64(5345345.53453))
        springOri.setCurrentValue(Float64(5345.53453))
        @Assert(listeners01.getFlag(),"onSpringUpdateonSpringUpdateonSpringUpdateonSpringUpdateonSpringUpdate")
        @Assert(springOri.getVelocity(),Float64(0))
        @Assert(springOri.getCurrentValue(),Float64(5345.53453))
    }
}
public class SubSpringListener <:SpringListener{
    public static var flag=""
    public func onSpringUpdate(spring:Spring):Unit{
        flag+="onSpringUpdate"
    }
    public func onSpringAtRest(spring:Spring):Unit{
        flag+="onSpringAtRest"
    }
    public func onSpringActivate(spring:Spring):Unit{
        flag+="onSpringActivate"
    }
    public func onSpringEndStateChange(spring:Spring):Unit{
        flag+="onSpringEndStateChange"
    }
    public func getFlag():String{
        return flag
    }
    public operator func !=(that: SpringListener): Bool {
        return !(this == that)
    }
    public operator func ==(that: SpringListener): Bool {
        return true
    }

    @OverflowWrapping
    public override func hashCode(): Int64 {
        var has: Int64 = 31
        return has
    }
}

