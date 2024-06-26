/*
 * @Copyright (c) Huawei Technologies Co., Ltd. 2024-2024. All rights reserved.
 */

package rebound

from std import collection.ArrayList
from std import collection.HashMap
from std import collection.Map
from std import collection.Set
from std import collection.concurrent.ConcurrentHashMap

public class BaseSpringSystem {
    private let mSpringRegistry: Map<String, Spring> = HashMap<String, Spring>()

    private let mActiveSprings: ConcurrentHashMap<Spring, Any> = ConcurrentHashMap<Spring, Any>()

    private let mSpringLooper: SpringLooper

    private let mListeners: Map<SpringSystemListener, Any> = HashMap<SpringSystemListener, Any>()

    private var mIdle: Bool = true

    public init(springLooper: SpringLooper) {
        mSpringLooper = springLooper
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

    public func getSpringById(id: String): ?Spring {
        return mSpringRegistry.get(id)
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

    func registerSpring(spring: Spring): Unit {
        if (mSpringRegistry.contains(spring.getId())) {
            throw IllegalArgumentException("spring is already registered")
        }
        mSpringRegistry.put(spring.getId(), spring)
    }

    func deregisterSpring(spring: Spring): Unit {
        mActiveSprings.remove(spring)
        mSpringRegistry.remove(spring.getId())
    }

    func advance(deltaTime: Float64): Unit {
        var optArr: ArrayList<Spring> = ArrayList<Spring>()
        for ((spring, _) in mActiveSprings) {
            if (spring.systemShouldAdvance()) {
                spring.advance(deltaTime / 1000.0)
            } else {
                optArr.append(spring)
            }
        }
        for (i in 0..optArr.size) {
            mActiveSprings.remove(optArr[i])
        }
    }

    public func loop(ellapsedMillis: Float64): Unit {
        for ((listener, _) in mListeners) {
            listener.onBeforeIntegrate(this)
        }
        advance(ellapsedMillis)
        if (mActiveSprings.isEmpty()) {
            mIdle = true
        }
        for ((listener, _) in mListeners) {
            listener.onAfterIntegrate(this)
        }
        if (!mIdle) {
            mSpringLooper.start()
        }
    }

    func activateSpring(springId: String): Unit {
        let spring: ?Spring = mSpringRegistry.get(springId)
        if (spring.isNone()) {
            throw IllegalArgumentException("springId " + springId + " does not reference a registered spring")
        }
        mActiveSprings.put(spring.getOrThrow(), 0)
        if (getIsIdle()) {
            mIdle = false
            mSpringLooper.start()
        }
    }

    public func addListener(newListener: SpringSystemListener): Unit {
        mListeners.put(newListener, 0)
    }

    public func removeListener(listenerToRemove: SpringSystemListener): Unit {
        mListeners.remove(listenerToRemove)
    }

    public func removeAllListeners(): Unit {
        mListeners.clear()
    }
}