package ohos_app_cangjie_entry

import ohos.base.*
import ohos.component.*
import ohos.state_manage.*
import ohos.state_macro_manage.*
import ohos.concurrency.*
import ohos.router.*
import ohos.state_macro_manage.Entry
import ohos.state_macro_manage.Component
import ohos.state_macro_manage.State
import ohos.state_macro_manage.r

@Entry
@Component
class Index {

    func build() {
        Flex(FlexParams(direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.SpaceEvenly)) {
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