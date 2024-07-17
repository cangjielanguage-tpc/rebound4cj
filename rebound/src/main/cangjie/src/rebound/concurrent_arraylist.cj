/*
 * @Copyright (c) Huawei Technologies Co., Ltd. 2024-2024. All rights reserved.
 */

package rebound

from std import sync.ReentrantMutex

public class ConcurrentArrayList<T> where T <: Hashable & Equatable<T> {

    var arr: Array<T> = Array<T>(16, item: unsafe {zeroValue<T>()})
    var size: Int64 = 0
    let lock: ReentrantMutex = ReentrantMutex()

    init() {}

    func containsArr(value: T): Bool {
        for (i in 0..size) {
            if (arr[i] == value) {
                return true
            }
        }
        return false
    }

    func put(value: T): Unit {
        synchronized(lock) {
            if (containsArr(value)) {
                return
            }
            let insideSize: Int64 = arr.size
            if (insideSize > size) {
                arr[size] = value
                size++
                return
            }
            let arr2 = Array<T>(insideSize * 2, item: unsafe {zeroValue<T>()})
            arr.copyTo(arr2, 0, 0, insideSize)
            arr = arr2
            arr[size] = value
            size++
        }
    }

    func remove(value: T): Unit {
        synchronized(lock) {
            arr = arr.clone()
            for (i in 0..size) {
                if (arr[i] == value) {
                    for (j in i..size - 1) {
                        arr[j] = arr[j + 1]
                    }
                    size--
                    return
                }
            }
        }
    }

    func isEmpty(): Bool {
        return arr.isEmpty()
    }

    func iterator(): Iterator<T> {
        return ConcurrentArrayListIterator<T>(arr, size)
    }

    func clear(): Unit {
        synchronized(lock) {
            size = 0
            arr = Array<T>(16, item: unsafe {zeroValue<T>()})
        }
    }
}

class ConcurrentArrayListIterator<T> <: Iterator<T> {
    let arr: Array<T>
    let size: Int64
    var position: Int64 = 0

    init(arr: Array<T>, size: Int64) {
        this.arr = arr
        this.size = size
    }

    public func next(): Option<T> {
        if (position < size) {
            let value = arr[position]
            position++
            return value
        }
        return None
    }

    public func iterator(): Iterator<T> {
        return this
    }
}