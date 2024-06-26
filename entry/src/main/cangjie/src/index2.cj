@Entry
@Component
class Index2 {

    @State var frictionSpringVal: Float64  = 0.0
    @State var imageSize: Float64 = 1.0
    @State var imgPath: CJResource = @r(app.media.arrow_up)
    @State var showComponent: Bool = false
    @State var origamiFriction: Float64  = 10.0

    func initSpring() {
        spring.setVelocity(10.0)
        spring.setSpringConfig(rebound.SpringConfig.coastingConfigWithOrigamiFriction(origamiFriction))
        let springConfig: rebound.SpringConfig = spring.getSpringConfig()
        frictionSpringVal = springConfig.friction
        let imageSizeFunc: (Float64) -> Unit = {
            v: Float64 =>
            launch {
                imageSize = v
            }
        }
        spring.addListener(MySpringListener(imageSizeFunc))
    }

    func setFriction(frictionval: Float64) {
        spring.setSpringConfig(rebound.SpringConfig.coastingConfigWithOrigamiFriction(frictionval))
        frictionSpringVal = spring.getSpringConfig().friction
        imageSize = 1.0
    }

    func render() {
        Stack(Alignment.Bottom) {
          Image(@r(app.media.landscape))
            .width(100.percent)
            .height(100.percent)
            .scale(x: Float32(imageSize), y: Float32(imageSize))
            .onTouch({ event =>
              if (event.eventType.toString() == TouchType.Down.toString()) {
                        spawn {
                            initSpring()
                    spring.setEndValue(1.0)
                        }

              } else if (event.eventType.toString() == TouchType.Up.toString() || event.eventType.toString() == TouchType.Cancel.toString()) {
                        spawn {
                            spring.setEndValue(0.0)
                        }

              }
            })
          Row() {
            Column() {
              Text("OrigamiFriction")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 15)
                .alignSelf(ItemAlign.Start)
              Text(frictionSpringVal.toString())
                .fontSize(20)
                .fontWeight(FontWeight.Regular)
            }

            Column() {
              Slider(value: origamiFriction, min: 1.0, max: 30.0, step: 1.0)
                .showTips(true)
                .onChange{ value: Float64, mode: SliderChangeMode =>
                  origamiFriction = value
                  setFriction(value)
                }
                .blockColor(Color.BLUE)
                .margin(top: 10)
            }
            .alignSelf(ItemAlign.Center)
            .padding(top: 10)
          }
          .margin(bottom: 60)
          .alignSelf(ItemAlign.End)
          .width(100.percent)
          .height(12.percent)
          .backgroundColor(Color.WHITE)
          .visibility(changeShowComponent2(showComponent))

          Image(imgPath)
            .height(8.percent)
            .width(15.percent)
            .alignSelf(ItemAlign.End)
            .onTouch{ event =>
              if (event.eventType.toString() == TouchType.Down.toString()) {
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

    func changeShowComponent2(b: Bool): Visibility {
        return if (b) {
        	Visibility.Hidden
        } else {
            Visibility.Visible
        }
    }
}