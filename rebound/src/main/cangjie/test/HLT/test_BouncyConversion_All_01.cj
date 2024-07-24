// 3rd_party_lib:rebound4ohos/rebound/src/main/cangjie/build/rebound

import rebound.rebound.*
@Test
public class TestBouncyConversion{
    /**
    public class BouncyConversion
    public init(speed: Float64, bounciness: Float64)
    public func getSpeed(): Float64
    public func getBounciness(): Float64
    public func getBouncyTension(): Float64
    public func getBouncyFriction(): Float64
    **/
    @TestCase
    func test_BouncyConversion_Init_01(): Unit {
        var bouncyConversion=BouncyConversion(Float64(8.9999),Float64(88888.9999))
        @Assert(bouncyConversion.getSpeed(),Float64(8.9999))
        @Assert(bouncyConversion.getBounciness(),Float64(88888.9999))
        @Assert(bouncyConversion.getBouncyTension(),Float64(53.308236764705896))
        @Assert(bouncyConversion.getBouncyFriction(),Float64(4.6767116598373905E7))
    }
    @TestCase
    func test_BouncyConversion_Init_02(): Unit {
        var bouncyConversion=BouncyConversion(Float64(-8.9999),Float64(-88888.9999))
        @Assert(bouncyConversion.getSpeed(),Float64(-8.9999))
        @Assert(bouncyConversion.getBounciness(),Float64(-88888.9999))
        @Assert(bouncyConversion.getBouncyTension(),Float64(-52.308236764705896))
        @Assert(bouncyConversion.getBouncyFriction(),Float64(-9.510901982117723e8))
    }
    @TestCase
    func test_BouncyConversion_Init_03(): Unit {
        var bouncyConversion=BouncyConversion(Float64(0),Float64(0))
        @Assert(bouncyConversion.getSpeed(),Float64(0.0))
        @Assert(bouncyConversion.getBounciness(),Float64(0.0))
        @Assert(bouncyConversion.getBouncyTension(),Float64(0.5))
        @Assert(bouncyConversion.getBouncyFriction(),Float64(1.5923375))
    }
}