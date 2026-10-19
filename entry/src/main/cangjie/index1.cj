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
import rebound.*

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
    var imgPath: AppResource = @r(app.media.arrow_up)
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
