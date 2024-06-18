/*
 * @Copyright (c) Huawei Technologies Co., Ltd. 2024-2024. All rights reserved.
 */

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

    public func addSpringConfig(springConfig: ?SpringConfig, configName: ?String): Bool {
        if (springConfig.isNone()) {
            throw IllegalArgumentException("springConfig is required")
        }
        if (configName.isNone()) {
            throw IllegalArgumentException("configName is required")
        }
        if (mSpringConfigMap.contains(springConfig.getOrThrow())) {
            return false
        }
        mSpringConfigMap.put(springConfig.getOrThrow(), configName.getOrThrow())
        return true
    }

    public func removeSpringConfig(springConfig: ?SpringConfig): Bool {
        if (springConfig.isNone()) {
            throw IllegalArgumentException("springConfig is required")
        }
        return Some<String>(mSpringConfigMap.remove(springConfig.getOrThrow()).toString()).isSome()
    }

    public func getAllSpringConfig(): Map<SpringConfig, String> {
        return this.mSpringConfigMap
    }

    public func removeAllSpringConfig(): Unit {
        mSpringConfigMap.clear()
    }
}
