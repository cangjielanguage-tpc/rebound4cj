package rebound

public class SpringConfigRegistry {
    private static let INSTANCE: SpringConfigRegistry = SpringConfigRegistry(true)

    public static func getInstance(): SpringConfigRegistry {
        return INSTANCE
    }

    private let mSpringConfigMap: HashMap<SpringConfig, String>

    init(includeDefaultEntry: Bool) {
        mSpringConfigMap = HashMap<SpringConfig, String>()
        if (includeDefaultEntry) {
            addSpringConfig(SpringConfig.defaultConfig, "default config")
        }
    }

    public func addSpringConfig(springConfig: SpringConfig, configName: String): Bool {
        if (mSpringConfigMap.contains(springConfig)) {
            return false
        }
        mSpringConfigMap.add(springConfig, configName)
        return true
    }

    public func removeSpringConfig(springConfig: SpringConfig): Bool {
        if (mSpringConfigMap.remove(springConfig).isSome()) {
            return true
        }
        return false
    }

    public func getAllSpringConfig(): Map<SpringConfig, String> {
        return this.mSpringConfigMap
    }

    public func removeAllSpringConfig(): Unit {
        mSpringConfigMap.clear()
    }
}
