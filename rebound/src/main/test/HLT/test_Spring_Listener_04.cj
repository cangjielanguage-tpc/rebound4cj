// 3rd_party_lib:rebound4cj/rebound/src/main/cangjie/target/release/rebound

import rebound.*
import std.random.*
@Test
public class TestSpringListener{
    /**
    public func addListener(newListener: ?SpringListener): Spring
    public func removeListener(listenerToRemove: ?SpringListener): Spring
    public func removeAllListeners(): Spring
    **/
    @TestCase
    func test_Spring_removeListener_02(): Unit {
        var springLooper=SteppingLooper()
        var baseSpringSystem=BaseSpringSystem(springLooper)
        var newListener01=SubSpringSystemListener()
        baseSpringSystem.addListener(newListener01)
        var springOri=baseSpringSystem.createSpring()
        var listeners01=SubSpringListener()
        var listeners02=SubSpringListener()
        springOri.addListener(listeners01)
        springOri.removeListener(listeners02)
        springOri.setCurrentValue(Float64(15))
        baseSpringSystem.loop(Float64(4567.888))
        @Assert(listeners01.getFlag(),"")
        @Assert(listeners02.getFlag(),"")
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
        let r=Random().nextInt64()
        var has: Int64 = 31*r*31
        return has
    }
}
public class SubSpringSystemListener <: SpringSystemListener{

    let r = Random().nextInt64()

    public func onBeforeIntegrate(springSystem:BaseSpringSystem):Unit{
        springSystem.createSpring()
    }
    public func onAfterIntegrate(springSystem:BaseSpringSystem):Unit{
        springSystem.createSpring()
    }
    public operator func !=(that: SpringSystemListener): Bool {
        if (this.hashCode() != that.hashCode()) {
            return true
        }
        return false
    }
    public operator func ==(that: SpringSystemListener): Bool {
        if (this.hashCode() == that.hashCode()) {
            return true
        }
        return false
    }

    @OverflowWrapping
    public override func hashCode(): Int64 {
        var has: Int64 = 31 * r * 31
        return has
    }
}

