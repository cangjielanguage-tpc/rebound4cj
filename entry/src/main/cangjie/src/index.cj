@Entry
@Component
class Index {

    func render() {
        Flex(FlexParams(direction: FlexDirection.FlexColumn, alignItems: ItemAlign.Center, justifyContent: FlexAlign.SpaceEvenly)) {
          Button("Spring (Tension & Friction)").onClick { =>
            Router.push(url: "Index1")
          }
          Button("Coasting Origami Friction").onClick { =>
            Router.push(url: "Index2")
          }
        }
        .width(100.percent)
        .height(100.percent)
        .backgroundColor(Color(0xFFF1A493))
    }
}