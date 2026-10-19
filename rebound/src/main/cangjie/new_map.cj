package rebound

class newMap {

    var arr: Array<(String, Spring)> = Array<(String, Spring)>(8, repeat: ("", unsafe {zeroValue<Spring>()}))
    var map: HashMap<String, Spring> = HashMap<String, Spring>()
    var size: Int64 = 0

    init() {}

    func putIfAbsent(key: String, value: Spring): Unit {
        if (size < 8) {
            for (i in 0..size) {
                if (arr[i][0] == key) {
                    return
                }
            }
            arr[size] = (key, value)
            size++
            if (size >= 8) {
                map = HashMap<String, Spring>(arr)
            }
            return
        }
        map.addIfAbsent(key, value)
        size++
    }

    func get(key: String): ?Spring {
        if (size < 8) {
            for (i in 0..size) {
                if (arr[i][0] == key) {
                    return arr[i][1]
                }
            }
        }
        return map.get(key)
    }

    func values(): Collection<Spring> {
        if (size < 8) {
            return Array<Spring>(size, {i: Int64 => arr[i][1]})
        }
        return map.values()
    }

    func remove(id: String): Unit {
        if (size < 8) {
            for (i in 0..size) {
                if (arr[i][0] == id) {
                    arr[i] = arr[size - 1]
                    arr[size - 1] = ("", unsafe {zeroValue<Spring>()})
                    size--
                    return
                }
            }
        } else {
            if (map.remove(id).isSome()) {
                size--
            }
        }
    }
}