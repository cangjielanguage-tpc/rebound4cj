/*
 * @Copyright (c) Huawei Technologies Co., Ltd. 2024-2024. All rights reserved.
 */

package rebound.rebound

public interface SpringSystemListener <: Hashable & Equatable<SpringSystemListener> {
    func onBeforeIntegrate(springSystem: BaseSpringSystem): Unit

    func onAfterIntegrate(springSystem: BaseSpringSystem): Unit
}