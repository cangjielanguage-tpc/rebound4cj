from ohos import base.*
from ohos import ability.*
from ohos import window.*

class MainAbility <: Ability {
    public init() {
        super()
        registerSelf()
    }

    public override func onCreate(want: Want, launchParam: LaunchParam): Unit {
        AppLog.info("MainAbility OnCreated.")
    }

    public override func onWindowStageCreate(windowStage: WindowStage): Unit {
        AppLog.info("MainAbility onWindowStageCreate.")
        windowStage.loadContent("MyView")
    }
}

func createAbility(): MainAbility {
    MainAbility()
}

let ABILITY_REGISTER_RESULT = Ability.registerCreator("CangjieAbility", createAbility)

