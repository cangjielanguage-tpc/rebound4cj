/*
 * @Copyright (c) Huawei Technologies Co., Ltd. 2024-2024. All rights reserved.
 */

package rebound

from std import sync.ReentrantMutex

public class ConcurrentArrayList<T> where T <: Hashable & Equatable<T> {

    let set: ArrayList<T> = ArrayList<T>()
    let lock: ReentrantMutex = ReentrantMutex()

    public init() {}

    public func put(value: T): Unit {
        synchronized(lock) {
            if (!set.contains(value)) {
                return set.append(value)
            }
        }
    }

    public func remove(value: T): Unit {
        synchronized(lock) {
            for (i in 0..set.size) {
                if (set[i] == value) {
                    set.remove(i)
                    return
                }
            }
        }
    }

    public func isEmpty(): Bool {
        return set.isEmpty()
    }

    public func iterator(): Iterator<T> {
        synchronized(lock) {
            return set.iterator()
        }
    }

    public func clear(): Unit {
        synchronized(lock) {
            return set.clear()
        }
    }
}