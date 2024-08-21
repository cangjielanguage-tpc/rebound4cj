<div align="center">
<h1>rebound4cj</h1>
</div>

<p align="center">
<img alt="" src="https://img.shields.io/badge/release-v0.0.1-brightgreen" style="display: inline-block;" />
<img alt="" src="https://img.shields.io/badge/build-pass-brightgreen" style="display: inline-block;" />
<img alt="" src="https://img.shields.io/badge/cjc-v0.53.4-brightgreen" style="display: inline-block;" />
<img alt="" src="https://img.shields.io/badge/cjcov-90.6%25-brightgreen" style="display: inline-block;" />
<img alt="" src="https://img.shields.io/badge/project-open-brightgreen" style="display: inline-block;" />
</p>

## 介绍

rebound4cj 是一个模拟弹簧动力学，作用于驱动物理动画
本库是一个用仓颉 + 仓颉UI编写的适用于鸿蒙系统的 rebound 库

### 特性

1. 创建弹簧对象，设置弹簧树形，实现弹簧动画效果

### 源码目录

```shell
.
├─AppScope
├─doc
├─entry
│  └─src
│      └─main
│          ├─cangjie
│          └─resources
├─rebound
│  └─src
│      └─main
│          ├─cangjie
│            └─src
│                └─rebound
├─hvigor
```

- `AppScope` 全局资源存放目录和应用全局信息配置目录
- `doc` API文档和使用手册存放目录
- `entry` 工程模块 - 编译生成一个HAP
- `entry src` APP代码目录
- `entry src main` APP项目目录
- `entry src main cangjie` 仓颉UI示例目录
- `entry src main resources` 资源文件目录
- `rebound` 工程模块 - 编译生成一个har包
- `rebound src` 模块代码目录
- `rebound src main` 模块项目目录
- `rebound src main cangjie` 仓颉代码目录
- `hvigor` 构建工具目录

### 接口说明

主要类和函数接口说明详见 [API](doc/feature_api.md)

## 使用说明

### 编译构建

1. 通过 module 引入
    1. 克隆下载项目
    2. 将 rebound 模块拷贝到应用项目下
    3. 修改自身应用 entry 下的 oh-package.json5 文件，在 dependencies 字段添加 "rebound": "file:../rebound"
       ```json
       {
          "name": "entry",
          "version": "",
          "description": "Please describe the basic information.",
          "main": "",
          "author": "",
          "license": "",
         "dependencies": {
             "rebound": "file:../rebound"
         }
       }
       ```
    4. 修改自身应用 entry/src/main/cangjie 下的 cjpm.toml 文件，在 [dependencies] 字段下添加 rebound = {path = "../../../../rebound/src/main/cangjie", version = "1.0.0"}
       ```toml
       [dependencies]
           rebound = {path = "../../../../rebound/src/main/cangjie"}
       ```
    5. 在项目中使用 import rebound.* 引用 rebound 项目
       ```cangjie
       import rebound.rebound.*
       ```
       
### 功能示例

**entry -> src -> main -> cangjie -> src 目录下 index.cj，运行可以展示示例效果。**

```cangjie
package ohos_app_cangjie_entry

import ohos.base.*
import ohos.component.*
import ohos.state_manage.*
import ohos.state_macro_manage.*
import ohos.concurrency.*
import ohos.state_macro_manage.Entry
import ohos.state_macro_manage.Component
import ohos.state_macro_manage.State
import ohos.state_macro_manage.r
import rebound.rebound.*

@Entry
@Component
class Index1 {

    @State
    var tension: Float64 = 40.0
    @State
    var friction: Float64 = 3.0
    @State
    var tensionSpringVal: Float64 = 0.0
    @State
    var frictionSpringVal: Float64 = 0.0
    @State
    var imageSize: Float64 = 1.0
    @State
    var imgPath: CJResource = @r(app.media.arrow_up)
    @State
    var showComponent: Bool = false

    func initSpring(): SpringConfig {
        spring.setSpringConfig(SpringConfig.defaultConfig)
        let springConfig: SpringConfig = spring.getSpringConfig()
        tensionSpringVal = springConfig.tension
        frictionSpringVal = springConfig.friction
        let imageSizeFunc: (Float64) -> Unit = {
            v: Float64 =>
            launch {
                imageSize = v
            }
        }
        spring.addListener(MySpringListener(imageSizeFunc))
        return springConfig
    }

    func setTension(tensionval: Float64) {
        let springConfig = initSpring()
        springConfig.tension = OrigamiValueConverter.tensionFromOrigamiValue(tensionval)
        tensionSpringVal = springConfig.tension
        imageSize = 1.0
    }

    func setFriction(frictionval: Float64) {
        let springConfig = initSpring()
        springConfig.friction = OrigamiValueConverter.frictionFromOrigamiValue(frictionval)
        frictionSpringVal = springConfig.friction
        imageSize = 1.0
    }

    func build() {
        Stack(Alignment.Bottom) {
            Image(@r(app.media.landscape))
                .width(100.percent)
                .height(100.percent)
                .scale(x: Float32(imageSize), y: Float32(imageSize))
                .onTouch {
                    event => if (event.eventType.toString() == TouchType.Down.toString()) {
                        spawn {
                            initSpring()
                            spring.setEndValue(1.0)
                        }
                } else if (event.eventType.toString() == TouchType.Up.toString() || event.eventType.toString() == TouchType.Cancel.toString()) {
                    spawn {
                          spring.setEndValue(0.0)
                    }
                }
            }
            Row() {
                Column() {
                    Text("Tension")
                        .fontSize(20)
                        .margin(top: 20)
                        .fontWeight(FontWeight.Bold)
                    Text(tensionSpringVal.toString())
                        .fontSize(20)
                        .fontWeight(FontWeight.Regular)
                    Text("Friction")
                        .fontSize(20)
                        .fontWeight(FontWeight.Bold)
                        .margin(top: 15)
                        .alignSelf(ItemAlign.Start)
                    Text(frictionSpringVal.toString())
                        .fontSize(20)
                        .fontWeight(FontWeight.Regular)
                }

                Column() {
                    Slider(value: tension, min: 1.0, max: 100.0, step: 2.0)
                        .showTips(true)
                        .onChange {
                            value: Float64, mode: SliderChangeMode => tension = value
                            setTension(value)
                        }
                        .blockColor(Color.BLUE)
                        .padding(bottom: 20)
                    Slider(value: friction, min: 1.0, max: 30.0, step: 1.0)
                        .showTips(true)
                        .onChange {
                            value: Float64, mode: SliderChangeMode => friction = value
                            setFriction(value)
                        }
                        .blockColor(Color.BLUE)
                        .margin(top: 20)
                }
                .alignSelf(ItemAlign.Center)
                .padding(top: 10)
            }
            .margin(bottom: 60)
            .alignSelf(ItemAlign.End)
            .width(100.percent)
            .height(20.percent)
            .backgroundColor(Color.WHITE)
            .visibility(changeShowComponent(showComponent))

            Image(imgPath)
                .height(8.percent)
                .width(15.percent)
                .objectFit(ImageFit.Contain)
                .alignSelf(ItemAlign.End)
                .onTouch {
                    event => if (event.eventType.toString() == TouchType.Down.toString()) {
                        if (showComponent) {
                            showComponent = false
                            imgPath = @r(app.media.arrow_up)
                        } else {
                            showComponent = true
                            imgPath = @r(app.media.arrow_down)
                            initSpring()
                    }
                }
            }
        }
    }

    func changeShowComponent(b: Bool): Visibility {
        return if (b) {
            Visibility.Hidden
        } else {
            Visibility.Visible
        }
    }
}
```

## 约束与限制

在下述版本验证通过：

DevEco Studio NEXT Developer Beta2(5.0.3.500), SDK:OHCangjie0.10.0-OH5.0.0.31。

## 开源协议

本项目基于 [BSD License](./LICENSE) ，请自由的享受和参与开源。

## 参与贡献

欢迎给我们提交PR，欢迎给我们提交Issue，欢迎参与任何形式的贡献。
