package utils

public class ValueBox<T> <: ToString {
    private let value: ?T

    public init(value: ?T) {
        this.value = value
    }

    public func get(): ?T {
        value
    }

    public func toString(): String {
        toString(value)
    }

    public static func check<V>(optional: ?V): Bool {
        match (optional) {
            case Some(_: ValueBox<T>) | Some(_: T) => true
            case _ => false
        }
    }

    public static func cast<V>(optional: ?V): ?T {
        match (optional) {
            case Some(v: ValueBox<T>) => v.get()
            case Some(v: T) => v
            case None => None
            case Some(v) =>
                throw ClassCastException("${TypeInfo.of(v).qualifiedName} cannot be cast to ${TypeInfo.of<T>().qualifiedName}")
        }
    }
}

extend ValueBox<T> <: Hashable where T <: Hashable {
    public func hashCode(): Int64 {
        get().hashCode()
    }
}

extend ValueBox<T> <: Equatable<T> & Equatable<ValueBox<T>> where T <: Equatable<T> {
    public operator func == (that: T): Bool {
        this.get() == that
    }

    public operator func != (that: T): Bool {
        !(this == that)
    }

    public operator func == (that: ValueBox<T>): Bool {
        this.get() == that.get()
    }

    public operator func != (that: ValueBox<T>): Bool {
        !(this == that)
    }
}

extend ValueBox<T> <: Synchronizable where T <: Synchronizable {
    public func getMonitor(): Monitor {
        get().getOrThrow().getMonitor()
    }
}
