## rebound4cj 库

### 介绍
rebound4cj 是一个模拟弹簧动力学，用于驱动物理动画的库。

### 1 创建弹簧对象，设置弹簧配置项，实现弹簧动画效果

前置条件：NA
场景：
创建和维护弹簧对象。通过配置张力、摩擦来创建弹簧对象，并添加监听器以接收弹簧位置
约束：NA 
性能： NA
可靠性： NA

#### 1.1 主要接口

BaseSpringSystem 类负责运行spring集成循环，并维护它所解决的所有spring的注册表

```cangjie
public class BaseSpringSystem {

    /**
    * BaseSpringSystem 的有参构造方法
    *
    * @param springLooper - 传入 SpringLooper 物理循环对象
    *
    */
    public init(springLooper: SpringLooper)

    /**
    * 创建弹簧
    *
    * @return 返回创建的弹簧
    *
    */
    public func createSpring(): Spring
}
```

Spring 弹簧对象

```cangjie
public class Spring {

    /**
    * 设置配置类
    *
    * @param springConfig 弹簧配置类
    *
    * @return 返回弹簧实例
    */
    public func setSpringConfig(springConfig: SpringConfig): Spring

    /**
    * 获取配置类
    *
    * @return 返回弹簧配置类
    */
    public func getSpringConfig(): SpringConfig

    /**
    * 向 Spring 弹簧实例添加监听器
    *
    * @param newListener 监听器对象
    *
    * @return 返回 Spring 弹簧实例
    */
    public func addListener(newListener: SpringListener): Spring

    /**
    * 设置 endValue 值以确定弹簧停止时所处的位置
    *
    * @param endValue - 弹簧运动静止时的目标值。注意：因为弹簧的"物理特性"， endValue 的值期望设置在 0.0 - 1.0 之间，若小于 0.0 或大于 1.0，会导致弹簧失去其物理特性，没有实际意义。 0.0 表示着弹簧当前处于完全松弛状态(没有拉伸或挤压)， 1.0 表示弹簧当前处于最大形变状态(完全拉伸或挤压到极限)。弹簧的弹性恢复过程可以通过从 1.0 逐渐变回 0.0 来表示
    *
    * @return 返回 Spring 弹簧对象
    */
    public func setEndValue(endValue: Float64): Spring
}
```

#### 1.2 其它接口

BaseSpringSystem 类负责运行spring集成循环，并维护它所解决的所有spring的注册表

```cangjie
public class BaseSpringSystem {

    /**
    * 检查系统是否空闲
    *
    * @return 返回系统是否空闲
    *
    */
    public func getIsIdle(): Bool

    /**
    * 根据 id 获取弹簧
    *
    * @param id - 传入弹簧 id
    *
    * @return 返回带指定 id 的弹簧，返回值是 Option 类型
    *
    */
    public func getSpringById(id: String): ?Spring

    /**
    * 返回所有弹簧
    *
    * @return 返回一个弹簧集合
    *
    */
    public func getAllSprings(): ArrayList<Spring>

    /**
    * 用于处理循环系统相关的逻辑，例如动画循环器(在每一帧动画更新时将被调用)
    *
    * @param ellapsedMillis - 从开始到当前时刻已经经过的毫秒数
    *
    */
    public func loop(ellapsedMillis: Float64): Unit

    /**
    * 为弹簧系统添加监听器
    *
    * @param newListener - 弹簧系统监听器接口
    *
    */
    public func addListener(newListener: SpringSystemListener): Unit

    /**
    * 删除监听器
    *
    * @param listenerToRemove - 弹簧系统监听器接口
    *
    */
    public func removeListener(listenerToRemove: SpringSystemListener): Unit

    /**
    * 清除所有的监听器
    *
    */
    public func removeAllListeners(): Unit
}
```

BouncyConversion 将弹性补丁的值转换为弹性张力和摩擦值

```cangjie
public class BouncyConversion {

    /**
    * BouncyConversion 的有参构造方法
    *
    * @param speed - 传入速度值
    * @param bounciness - 传入反弹力度值
    *
    */
    public init(speed: Float64, bounciness: Float64)

    /**
    * 获取速度值
    *
    * @return 返回速度
    *
    */
    public func getSpeed(): Float64

    /**
    * 获取反弹力度值
    *
    * @return 返回反弹力
    *
    */
    public func getBounciness(): Float64

    /**
    * 获取转换后的反弹张力值
    *
    * @return 返回反弹张力
    *
    */
    public func getBouncyTension(): Float64

    /**
    * 获取转换后的反弹摩擦值
    *
    * @return 返回反弹摩擦
    *
    */
    public func getBouncyFriction(): Float64
}
```

OrigamiValueConverter 将张力和摩擦值转换为弹簧系统所需的值

```cangjie
public class OrigamiValueConverter {

    /**
    * OrigamiValueConverter 的无参构造方法
    **/
    public init()

    /**
    * 将弹簧系统中的值转换为张力
    *
    * @param oValue - 弹簧系统中的值
    *
    * @return 返回反弹张力
    *
    */
    public static func tensionFromOrigamiValue(oValue: Float64): Float64

    /**
    * 将张力值转换为弹簧系统所需的值
    *
    * @param tension - 反弹张力值
    *
    * @return 返回弹簧系统所需的值
    *
    */
    public static func origamiValueFromTension(tension: Float64): Float64

    /**
    * 将弹簧系统中的值转换为摩擦值
    *
    * @param oValue - 弹簧系统中的值
    *
    * @return 返回反弹摩擦
    *
    */
    public static func frictionFromOrigamiValue(oValue: Float64): Float64

    /**
    * 将摩擦值转换为弹簧系统所需的值
    *
    * @param tension - 反弹摩擦值
    *
    * @return 返回弹簧系统所需的值
    *
    */
    public static func origamiValueFromFriction(friction: Float64): Float64
}
```

SimpleSpringListener 抽象监听器基类

```cangjie
public abstract class SimpleSpringListener <: SpringListener {

    /**
    * SimpleSpringListener 的无参构造方法
    **/
    public init()

    /**
    * 更新弹簧
    *
    * @param _ - 传入弹簧对象
    *
    */
    override public open func onSpringUpdate(_: Spring): Unit

    /**
    * 使弹簧休息
    *
    * @param _ - 传入弹簧对象
    *
    */
    override public open func onSpringAtRest(_: Spring): Unit

    /**
    * 激活弹簧
    *
    * @param _ - 传入弹簧对象
    *
    */
    override public open func onSpringActivate(_: Spring): Unit

    /**
    * 监听弹簧状态变化
    *
    * @param _ - 传入弹簧对象
    *
    */
    override public open func onSpringEndStateChange(_: Spring): Unit
}
```

SpringConfigRegistry 用于维护所有弹簧配置的注册表

```cangjie
public class SpringConfigRegistry {

    /**
    * 获取 SpringConfigRegistry 实例
    *
    * @return 返回 SpringConfigRegistry 实例
    *
    */
    public static func getInstance(): SpringConfigRegistry

    /**
    * 向注册表添加一个 SpringConfig
    *
    * @param springConfig - 将 springConfig 添加到注册表中
    * @param configName - name 在注册表中给出 springConfig
    *
    * @return 如果添加了 SpringConfig，则为 true，如果已经存在该名称的配置，则为 false
    */
    public func addSpringConfig(springConfig: SpringConfig, configName: String): Bool

    /**
    * 从注册表中删除一个特定的SpringConfig
    *
    * @param springConfig - 要删除的 springConfig
    *
    * @return 如果 SpringConfig 被删除，则为 true，如果它不存在，则为 false
    */
    public func removeSpringConfig(springConfig: SpringConfig): Bool

    /**
    * 获取注册表中所有的 SpringConfig
    *
    * @return 返回注册表中所有的 SpringConfig，为一个 map 集合
    */
    public func getAllSpringConfig(): Map<SpringConfig, String>

    /**
    * 删除注册表中所有的 SpringConfig
    */
    public func removeAllSpringConfig(): Unit
}
```

SpringConfig 用于存储弹簧配置的数据结构

```cangjie
public class SpringConfig {

    /**
    * SpringConfig 的有参构造方法
    *
    * @param tension - 传入弹簧张力值
    * @param bounciness - 传入弹簧摩擦值
    *
    */
    public init(tension: Float64, friction: Float64)

    /**
    * 映射方法，将值映射到 Origami 值
    *
    * @param qcTension - 传入弹簧张力值
    * @param qcFriction - 传入弹簧摩擦值
    * 
    * @return 返回映射到这些值的 SpringConfig
    *
    */
    public static func fromOrigamiTensionAndFriction(qcTension: Float64, qcFriction: Float64): SpringConfig

    /**
    * 映射方法，将值映射到指定的动画值
    *
    * @param bounciness - 传入动画的弹性速度
    * @param speed - 传入动画的速度
    * 
    * @return 返回映射到指定动画值的 SpringConfig
    *
    */
    public static func fromBouncinessAndSpeed(bounciness: Float64, speed: Float64): SpringConfig

    /**
    * 映射方法，将值映射到指定的滑行值
    *
    * @param friction - 传入弹性摩擦
    * 
    * @return 返回映射到指定滑行值的 SpringConfig
    *
    */
    public static func coastingConfigWithOrigamiFriction(friction: Float64): SpringConfig

    /**
    * 判断两个 SpringConfig 对象是否相等，若相等则为 true，反之为 false
    *
    * @param other - 传入另一个 SpringConfig 对象
    * 
    * @return 返回两个 SpringConfig 对象是否相等
    */
    public operator func ==(other: SpringConfig): Bool

    /**
    * 判断两个 SpringConfig 对象是否不相等，若不相等则为 true，反之为 false
    *
    * @param other - 传入另一个 SpringConfig 对象
    * 
    * @return 返回两个 SpringConfig 对象是否不相等
    */
    public operator func !=(other: SpringConfig): Bool

    /**
    * SpringConfig 的 hashcode 方法
    *
    * @return 返回 SpringConfig hash 值
    */
    public override func hashCode(): Int64
}
```

SpringListener 监听器接口

```cangjie
public interface SpringListener {

    /**
    * 更新弹簧
    *
    * @param spring - 传入弹簧对象
    *
    */
    func onSpringUpdate(spring: Spring): Unit

    /**
    * 使弹簧休息
    *
    * @param spring - 传入弹簧对象
    *
    */
    func onSpringAtRest(spring: Spring): Unit

    /**
    * 激活弹簧
    *
    * @param spring - 传入弹簧对象
    *
    */
    func onSpringActivate(spring: Spring): Unit

    /**
    * 监听弹簧状态变化
    *
    * @param spring - 传入弹簧对象
    *
    */
    func onSpringEndStateChange(spring: Spring): Unit
}
```

SpringLooper 弹簧循环器

```cangjie
public abstract class SpringLooper {

    /**
    * 设置弹簧系统到循环器中
    *
    * @param springSystem - 传入弹簧系统，为 Option 类型
    *
    */
    public func setSpringSystem(springSystem: ?BaseSpringSystem): Unit

    /**
    * 循环器启动
    */
    public func start(): Unit

    /**
    * 循环器停止
    */
    public func stop(): Unit
}
```
SpringSystemListener 弹簧系统监听器接口

```cangjie
public interface SpringSystemListener {

    /**
    * 在通过物理集成循环之前运行，提供集成之前对物理状态进行设置或更改的机会
    *
    * @param springSystem - 传入弹簧系统
    *
    */
    func onBeforeIntegrate(springSystem: BaseSpringSystem): Unit

    /**
    * 在通过物理集成循环之后运行，提供集成之后对物理状态进行设置或更改的机会
    *
    * @param springSystem - 传入弹簧系统
    *
    */
    func onAfterIntegrate(springSystem: BaseSpringSystem): Unit
}
```

SpringUtil 工具方法

```cangjie
public class SpringUtil {

    /**
    * 将给定范围内的值映射到另一个范围
    *
    * @param value - 要映射的值
    * @param fromLow - 范围的低端
    * @param fromHigh - 范围的高端
    * @param toLow - 要映射到的范围的低端
    * @param toHigh - 要映射到的范围的高端
    *
    * @return 返回映射后的结果
    */
    public static func mapValueFromRangeToRange(value: Float64, fromLow: Float64, fromHigh: Float64, toLow: Float64, toHigh: Float64): Float64

    /**
    * 固定某个范围，映射到值
    *
    * @param value - 值
    * @param low - 范围的低端
    * @param high - 范围的高端
    *
    * @return 返回固定后的值
    */
    public static func clamp(value: Float64, low: Float64, high: Float64): Float64
}
```

SteppingLooper 步进循环器，以固定的时间步长来逐步推进模拟，可以得到在一段时间内某个物体运动的轨迹

```cangjie

public class SteppingLooper <: SpringLooper {

    /**
    * SteppingLooper 的无参构造方法
    *
    */
    public init()

    /**
    * 循环器启动
    */
    override public func start(): Unit

    /**
    * 循环器步进方法
    *
    * @param interval - 传入时间间隔
    *
    * @return 返回是否步进
    */
    public func step(interval: Int64): Bool

    /**
    * 循环器停止
    */
    override public func stop(): Unit
}
```

SynchronousLooper 同步循环器，提供了一种同步机制，使其在模拟过程能够与其它外部事件或系统进行同步

```cangjie
public class SynchronousLooper <: SpringLooper {

    /**
    * SynchronousLooper 的无参构造方法
    *
    */
    public init()

    /**
    * 获取时间步长
    *
    * @return 返回步长值
    */
    public func getTimeStep(): Float64

    /**
    * 设置时间步长
    *
    * @param 设置步长值
    */
    public func setTimeStep(timeStep: Float64): Unit

    /**
    * 循环器启动
    */
    public override func start(): Unit

    /**
    * 循环器停止
    */
    public override func stop(): Unit
}
```

Spring 弹簧对象

```cangjie
public class Spring {

    /**
    * 销毁 Spring 弹簧对象
    */
    public func destroy(): Unit

    /**
    * 获得 Spring 弹簧对象的 id
    *
    * @return 返回 id
    */
    public func getId(): String

    /**
    * 设置位移值以确定弹簧从静止值的位移
    *
    * @param currentValue 弹簧的新起始值和当前值
    *
    * @return 返回弹簧实例
    */
    public func setCurrentValue(currentValue: Float64): Spring

    /**
    * 设置位移值以确定弹簧从静止值的位移
    *
    * @param currentValue 弹簧的新起始值和当前值
    * @param atRest 如果为 false 意味着如果弹簧的 endValue 不等于 currentValue，物理系统将开始迭代以将弹簧解析为结束值，默认为 true
    *
    * @return 返回弹簧实例
    */
    public func setCurrentValue(currentValue: Float64, atRest: Bool): Spring

    /**
    * 获取上次调用 setCurrentValue 时的位移值
    *
    * @return 返回位移值
    */
    public func getStartValue(): Float64

    /**
    * 获取当前值
    *
    * @return 返回位移值
    */
    public func getCurrentValue(): Float64

    /**
    * 从弹簧的静止值中得到弹簧当前值的位移
    *
    * @return 返回位移值
    */
    public func getCurrentDisplacementDistance(): Float64

    /**
    * 获取 rest 值
    *
    * @return 返回 rest 值
    */
    public func getEndValue(): Float64

    /**
    * 设置弹簧的速度，单位是像素每秒
    *
    * @param velocity - 传入速度值
    *
    * @return 返回 Spring 弹簧对象
    */
    public func setVelocity(velocity: Float64): Spring

    /**
    * 获取弹簧的速度
    *
    * @return 返回速度值
    */
    public func getVelocity(): Float64

    /**
    * 设置弹簧处于静止状态时的速度
    *
    * @param restSpeedThreshold - 每秒像素数
    *
    * @return 返回 Spring 弹簧对象
    */
    public func setRestSpeedThreshold(restSpeedThreshold: Float64): Spring

    /**
    * 获取弹簧处于静止状态时的速度
    *
    * @return 获取静止状态下的速度
    */
    public func getRestSpeedThreshold(): Float64

    /**
    * 设置从静止位移的阈值，低于该阈值弹簧应被认为处于静止状态
    *
    * @param displacementFromRestThreshold - 休息的位移
    *
    * @return 返回 Spring 弹簧对象
    */
    public func setRestDisplacementThreshold(displacementFromRestThreshold: Float64): Spring

    /**
    * 获取静止位移的阈值
    *
    * @return 返回静止状态下的位移阈值
    */
    public func getRestDisplacementThreshold(): Float64

    /**
    * 迫使弹簧夹紧其末端值，以避免超调目标值
    *
    * @param overshootClampingEnabled - 是否启用超调夹
    *
    * @return 返回 Spring 弹簧对象
    */
    public func setOvershootClampingEnabled(overshootClampingEnabled: Bool): Spring

    /**
    * 检查是否启用了超调夹紧
    *
    * @return 返回是否启用了超调夹
    */
    public func isOvershootClampingEnabled(): Bool

    /**
    * 检查弹簧是否超调超过目标
    *
    * @return 返回是否超调超过目标
    */
    public func isOvershooting(): Bool

    /**
    * 检查这个弹簧是否需要系统提前
    *
    * @return 返回是否需要系统提前
    */
    public func systemShouldAdvance(): Bool

    /**
    * 检查弹簧在之前的迭代中是否处于静止状态
    *
    * @return 返回在之前的迭代中是否处于静止状态
    */
    public func wasAtRest(): Bool

    /**
    * 检查当前状态是否为静止状态
    *
    * @return 返回当前状态是否为静止状态
    */
    public func isAtRest(): Bool

    /**
    * 通过使弹簧的末端值等于其当前值并将速度设置为0，将弹簧设置为静止状态
    *
    * @return 返回 Spring 弹簧实例
    */
    public func setAtRest(): Spring

    /**
    * 从 Spring 弹簧实例中删除监听器
    *
    * @param listenerToRemove 监听器对象
    *
    * @return 返回 Spring 弹簧实例
    */
    public func removeListener(listenerToRemove: SpringListener): Spring

    /**
    * 删除弹簧中的所有监听器
    *
    * @return 返回 Spring 弹簧实例
    */
    public func removeAllListeners(): Spring

    /**
    * 检查当前弹簧位移值是否等于输入，即为弹簧的静位移阈值
    *
    * @param value - 用来比较弹簧的值
    *
    * @return 返回弹簧的位移值是否在比较值的范围内
    */
    public func currentValueIsApproximately(value: Float64): Bool

    /**
    * 判断两个 Spring 对象是否相等，若相等则为 true，反之为 false
    *
    * @param other - 传入另一个 Spring 对象
    * 
    * @return 返回两个 Spring 对象是否相等
    */
    public operator func ==(other: Spring): Bool

    /**
    * 判断两个 Spring 对象是否不相等，若不相等则为 true，反之为 false
    *
    * @param other - 传入另一个 Spring 对象
    * 
    * @return 返回两个 Spring 对象是否不相等
    */
    public operator func !=(other: Spring): Bool

    /**
    * Spring 的 hashcode 方法
    *
    * @return 返回 Spring hash 值
    */
    public override func hashCode(): Int64
}
```

#### 1.3 示例

```cangjie
from std import unittest.*
from std import unittest.testmacro.*
from std import collection.*
from rebound import rebound.*

main(): Int64 {
    var test = TestReadme01()
    test.execute()
    test.printResult()
    return 0
}

@Test
public class TestReadme01 {

    @TestCase
    public func test01(): Unit {
        let bss: BaseSpringSystem = BaseSpringSystem(SteppingLooper())
        let s: Spring = bss.createSpring()
        s.setSpringConfig(SpringConfig.defaultConfig)
        let lis: MySpringSystemListener3 = MySpringSystemListener3()
        s.addListener(lis)
        s.setEndValue(10.0)
    }
}

class MySpringSystemListener3 <: SimpleSpringListener {

    var str: String = ""

    public func onSpringUpdate(_: Spring): Unit { }

    public func onSpringAtRest(_: Spring): Unit { }

    public func onSpringActivate(_: Spring): Unit { }

    public func onSpringEndStateChange(_: Spring): Unit { }

    public operator func !=(that: SpringListener): Bool {
        return !(this == that)
    }
    public operator func ==(that: SpringListener): Bool {
        return true
    }

    @OverflowWrapping
    public override func hashCode(): Int64 {
        var has: Int64 = 31 * str.hashCode()
        return has
    }
}
```

执行结果如下：
```shell
[ PASSED ] CASE: test01
```