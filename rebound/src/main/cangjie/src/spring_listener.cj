/*
 * @Copyright (c) Huawei Technologies Co., Ltd. 2024-2024. All rights reserved.
 */

package rebound

public interface SpringListener <: Hashable & Equatable<SpringListener> {
    func onSpringUpdate(spring: Spring): Unit

    func onSpringAtRest(spring: Spring): Unit

    func onSpringActivate(spring: Spring): Unit

    func onSpringEndStateChange(spring: Spring): Unit
}