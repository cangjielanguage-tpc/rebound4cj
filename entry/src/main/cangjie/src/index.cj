from ohos import base.*
from ohos import component.*
from ohos import state_manage.*
from ohos import state_macro_manage.*
from cj_res import default.*

@Entry
@Component
class MyView {
    func render() {
        Column {
            Button("Hello Cangjie").onClick {
                evt => AppLog.info("Hello Cangjie")
            }.width(400.px).height(150.px)
        }
    }
}
