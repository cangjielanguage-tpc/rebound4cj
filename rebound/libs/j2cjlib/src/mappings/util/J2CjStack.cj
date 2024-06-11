package mappings.util
import mappings.lang.HashableImpl

public open class J2CjStack<E> <: Hashable & ToString {
    private var elements: ?Array<?E> = None

    private var head: Int32 = 0

    private var tail: Int32 = 0

    private func doubleCapacity(): Unit {
        if (head != tail) {
            throw Exception("head != tail")
        }
        let p = head
        let n = Int32(elements.getOrThrow().size)
        let r = n - p
        let newCapacity = n << 1i32
        if (newCapacity < 0i32) {
            throw Exception("Sorry, stack too big")
        }
        let zero: ?E = Some(unsafe { zeroValue<E>() })
        let newArr: Array<?E> = Array<?E>(Int64(newCapacity), item: zero)
        elements.getOrThrow().copyTo(newArr, Int64(p), 0, Int64(r))
        elements.getOrThrow().copyTo(newArr, 0, Int64(r), Int64(p))
        elements = newArr
        head = 0i32
        tail = n
    }

    public init() {
        let zero: ?E = Some<E>(unsafe { zeroValue<E>() })
        elements = Array<?E>(16, item: zero)
    }

    public open func addFirst(e: ?E): Unit {
        if (e.isNone()) {
            throw Exception("Adding null")
        }
        elements.getOrThrow()[Int64(match (0) { case _ => head = (head - 1i32) & (Int32(elements.getOrThrow().size) - 1i32); head })] = e
        if (head == tail) {
            doubleCapacity()
        }
    }

    public open func removeFirst(): ?E {
        let x = pollFirst()
        if (x.isNone()) {
            throw Exception("No such element")
        }
        return x
    }

    public open func pollFirst(): ?E {
        let h = head
        let result = elements.getOrThrow()[Int64(h)]
        if (result.isNone()) {
            return None
        }
        elements.getOrThrow()[Int64(h)] = None
        head = (h + 1i32) & (Int32(elements.getOrThrow().size) - 1i32)
        return result
    }

    public open func peekFirst(): ?E {
        return elements.getOrThrow()[Int64(head)]
    }

    public open func peek(): ?E {
        return peekFirst()
    }

    public open func push(e: ?E): Unit {
        addFirst(e)
    }

    public open func pop(): ?E {
        return removeFirst()
    }

    public open func clear(): Unit {
        let h = head
        let t = tail
        if (h != t) {
            head = match (0) { case _ => tail = 0i32; tail }
            var i = h
            let mask = Int32(elements.getOrThrow().size) - 1i32
            do {
                elements.getOrThrow()[Int64(i)] = None
                i = (i + 1i32) & mask
            } while (i != t)
        }
    }

    public open func isEmpty(): Bool {
        return head == tail
    }

    public open func hashCode(): Int64 {
        return this.hashCodeImpl()
    }

    public open func toString(): String {
        return "J2CjStack<E>@${this.hashCodeImpl()}"
    }
}