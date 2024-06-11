/*
 * @Copyright (c) Huawei Technologies Co., Ltd. 2024-2024. All rights reserved.
 */

package rebound

from std import collection.ArrayList
from std import collection.HashMap
from std import collection.Map
from std import collection.HashSet
from std import collection.Set

public class BaseSpringSystem {
    private let mSpringRegistry: Map<String, Spring> = HashMap<String, Spring>()

    private let mActiveSprings: Set<Spring> = HashSet<Spring>()

    private let mSpringLooper: SpringLooper

    private let mListeners: Set<SpringSystemListener> = HashSet<SpringSystemListener>()

    private var mIdle: Bool = true

    public init(springLooper: ?SpringLooper) {
        if (springLooper.isNone()) {
            throw IllegalArgumentException("springLooper is required")
        }
        mSpringLooper = springLooper.getOrThrow()
        mSpringLooper.setSpringSystem(this)
    }

    public func getIsIdle(): Bool {
        return mIdle
    }

    public func createSpring(): Spring {
        let spring = Spring(this)
        registerSpring(spring)
        return spring
    }

    public func getSpringById(id: ?String): ?Spring {
        if (id.isNone()) {
            throw IllegalArgumentException("id is required")
        }
        return mSpringRegistry.get(id ?? "")
    }

    public func getAllSprings(): ArrayList<Spring> {
        let collection: Collection<Spring> = mSpringRegistry.values()
        let list: ArrayList<Spring>
        if (collection is ArrayList<Spring>) {
            list = (collection as ArrayList<Spring>) ?? ArrayList<Spring>()
        } else {
            list = ArrayList<Spring>(collection)
        }
        return list
    }

    func registerSpring(spring: ?Spring): Unit {
        if (spring.isNone()) {
            throw IllegalArgumentException("spring is required")
        }
        if (mSpringRegistry.contains(spring.getOrThrow().getId())) {
            throw IllegalArgumentException("spring is already registered")
        }
        mSpringRegistry.put(spring.getOrThrow().getId(), spring.getOrThrow())
    }

    func deregisterSpring(spring: ?Spring): Unit {
        if (spring.isNone()) {
            throw IllegalArgumentException("spring is required")
        }
        mActiveSprings.remove(spring.getOrThrow())
        mSpringRegistry.remove(spring.getOrThrow().getId())
    }

    func advance(deltaTime: Float64): Unit {
        for (spring in mActiveSprings) {
            if (spring.systemShouldAdvance()) {
                spring.advance(deltaTime / 1000.0)
            } else {
                mActiveSprings.remove(spring)
            }
        }
    }

    public func loop(ellapsedMillis: Float64): Unit {
        for (listener in mListeners) {
            listener.onBeforeIntegrate(this)
        }
        advance(ellapsedMillis)
        if (mActiveSprings.isEmpty()) {
            mIdle = true
        }
        for (listener in mListeners) {
            listener.onAfterIntegrate(this)
        }
        if (mIdle) {
            mSpringLooper.stop()
        }
    }

    func activateSpring(springId: String): Unit {
        let spring: ?Spring = mSpringRegistry.get(springId)
        if (spring.isNone()) {
            throw IllegalArgumentException("springId " + springId + " does not reference a registered spring")
        }
        mActiveSprings.put(spring.getOrThrow())
        if (getIsIdle()) {
            mIdle = false
            mSpringLooper.start()
        }
    }

    public func addListener(newListener: ?SpringSystemListener): Unit {
        if (newListener.isNone()) {
            throw IllegalArgumentException("newListener is required")
        }
        mListeners.put(newListener.getOrThrow())
    }

    public func removeListener(listenerToRemove: ?SpringSystemListener): Unit {
        if (listenerToRemove.isNone()) {
            throw IllegalArgumentException("listenerToRemove is required")
        }
        mListeners.remove(listenerToRemove.getOrThrow())
    }

    public func removeAllListeners(): Unit {
        mListeners.clear()
    }
}