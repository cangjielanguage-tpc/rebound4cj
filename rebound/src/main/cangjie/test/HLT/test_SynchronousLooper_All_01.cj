// 3rd_party_lib:rebound4ohos/rebound/src/main/cangjie/build/rebound

import std.math.*
import rebound.rebound.*
@Test
public class TestSynchronousLooper{
    /**
    public class SynchronousLooper
    public init()
    public func getTimeStep(): Float64
    public func setTimeStep(timeStep: Float64): Unit
    public override func start(): Unit
    public override func stop(): Unit
    **/
    @TestCase
    func test_SynchronousLooper_All_01(): Unit {
        var synchronouslooper=SynchronousLooper()
        @Assert(synchronouslooper.getTimeStep(),Float64(16.6667))
    }
    @TestCase
    func test_SynchronousLooper_All_02(): Unit {
        var synchronouslooper=SynchronousLooper()
        synchronouslooper.setTimeStep(Float64(-32424242243.443))
        @Assert(synchronouslooper.getTimeStep(),Float64(-32424242243.443))
        synchronouslooper.setTimeStep(Float64(32424242243.443))
        @Assert(synchronouslooper.getTimeStep(),Float64(32424242243.443))
        synchronouslooper.setTimeStep(Float64(0))
        @Assert(synchronouslooper.getTimeStep(),Float64(0))
    }
    @TestCase
    func test_SynchronousLooper_All_03(): Unit {
        var synchronouslooper=SynchronousLooper()
        synchronouslooper.setTimeStep(Float64(-32424242243.443))
        synchronouslooper.start()
        synchronouslooper.stop()
    }
    @TestCase
    func test_SynchronousLooper_All_04(): Unit {
        var synchronouslooper=SynchronousLooper()
        synchronouslooper.setTimeStep(Float64(32424242243.443))
        synchronouslooper.start()
        synchronouslooper.stop()
    }
    @TestCase
    func test_SynchronousLooper_All_05(): Unit {
        var synchronouslooper=SynchronousLooper()
        synchronouslooper.setTimeStep(Float64(0))
        synchronouslooper.start()
        synchronouslooper.stop()
    }
    @TestCase
    func test_SynchronousLooper_All_06(): Unit {
        var synchronouslooper=SynchronousLooper()
        synchronouslooper.setTimeStep(Float64(0))
        synchronouslooper.stop()
        synchronouslooper.start()
    }
}