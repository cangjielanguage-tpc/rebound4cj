// 3rd_party_lib:rebound4ohos/rebound/src/main/cangjie/build/rebound

from std import math.*
from rebound import rebound.*
@Test
public class TestSteppingLooper{
    /**
    public class SteppingLooper
    override public func start(): Unit
    public func step(interval: Int64): Bool
    override public func stop(): Unit
    **/
    @TestCase
    func test_SteppingLooper_All_01(): Unit {
        var steppinglooper=SteppingLooper()
        steppinglooper.start()
        @Assert(steppinglooper.step(5),false)
    }
    @TestCase
    func test_SteppingLooper_All_02(): Unit {
        var steppinglooper=SteppingLooper()
        @Assert(steppinglooper.step(5),false)    }
    @TestCase
    func test_SteppingLooper_All_03(): Unit {
        var steppinglooper=SteppingLooper()
        steppinglooper.start()
        @Assert(steppinglooper.step(5),false)
        steppinglooper.stop()
        @Assert(steppinglooper.step(5),false)
    }
    @TestCase
    func test_SteppingLooper_All_04(): Unit {
        var steppinglooper=SteppingLooper()
        var steppingloopertmp=SteppingLooper()
        var baseSpringSystem=BaseSpringSystem(steppingloopertmp)
        steppinglooper.setSpringSystem(baseSpringSystem)
        steppinglooper.start()
        @Assert(steppinglooper.step(5),true)
    }
    @TestCase
    func test_SteppingLooper_All_05(): Unit {
        var steppinglooper=SteppingLooper()
        var steppingloopertmp=SteppingLooper()
        var baseSpringSystem=BaseSpringSystem(steppingloopertmp)
        steppinglooper.setSpringSystem(baseSpringSystem)
        @Assert(steppinglooper.step(5),false)
    }
    @TestCase
    func test_SteppingLooper_All_06(): Unit {
        var steppinglooper=SteppingLooper()
        var steppingloopertmp=SteppingLooper()
        var baseSpringSystem=BaseSpringSystem(steppingloopertmp)
        steppinglooper.setSpringSystem(baseSpringSystem)
        steppinglooper.start()
        @Assert(steppinglooper.step(5),true)
        steppinglooper.stop()
        @Assert(steppinglooper.step(5),false)
    }
    @TestCase
    func test_SteppingLooper_All_07(): Unit {
        var steppinglooper=SteppingLooper()
        var steppingloopertmp=SteppingLooper()
        var baseSpringSystem=BaseSpringSystem(steppingloopertmp)
        steppinglooper.setSpringSystem(baseSpringSystem)
        steppinglooper.start()
        @Assert(steppinglooper.step(Int64.Max),true)
        steppinglooper.stop()
        @Assert(steppinglooper.step(Int64.Max),false)
    }
    @TestCase
    func test_SteppingLooper_All_08(): Unit {
        var steppinglooper=SteppingLooper()
        var steppingloopertmp=SteppingLooper()
        var baseSpringSystem=BaseSpringSystem(steppingloopertmp)
        steppinglooper.setSpringSystem(baseSpringSystem)
        steppinglooper.start()
        @Assert(steppinglooper.step(Int64.Min),true)
        steppinglooper.stop()
        @Assert(steppinglooper.step(Int64.Min),false)
    }
    @TestCase
    func test_SteppingLooper_All_09(): Unit {
        var steppinglooper=SteppingLooper()
        var steppingloopertmp=SteppingLooper()
        var baseSpringSystem=BaseSpringSystem(steppingloopertmp)
        steppinglooper.setSpringSystem(baseSpringSystem)
        steppinglooper.start()
        @Assert(steppinglooper.step(0),true)
        steppinglooper.stop()
        @Assert(steppinglooper.step(0),false)
    }
}