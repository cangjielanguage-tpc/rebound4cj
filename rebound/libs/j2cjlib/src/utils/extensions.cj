package utils

from std import collection.ArrayList
from std import math.min
from std import math.max

public interface AsString {
    func asString(): String
}

extend Option<T> <: AsString {
    public func asString(): String {
        match (this) {
            case Some(v: String) => v
            case Some(v: ToString) => v.toString()
            case Some(v) => toString(v)
            case None => "null"
        }
    }
}

public interface J2CjArrayListExtension {}

extend ArrayList<T> <: J2CjArrayListExtension where T <: Equatable<T> {
    public func removeObject(element: T) {
        removeIf { e => e == element }
    }
}

public interface J2CjStringReaderExtension {}

extend StringReader<T> <: J2CjStringReaderExtension {
    public func read(buf: Array<Char>): Int32 {
        for (i in 0..buf.size) {
            buf[i] = match (read()) {
                case Some(c) => c
                case None => return if (i == 0) { -1 } else { Int32(i) }
            }
        }
        return Int32(buf.size)
    }
}

public interface J2CjStringBuilderExtension {}

extend StringBuilder <: J2CjStringBuilderExtension {
    public func setLength(newLength: Int64) {
        let asString = toString()
        let content = String(Array<Char>(newLength) {
                i => if (i < min(newLength, size)) { Char(asString[i]) } else { '\u{0000}' }
        })
        reset(capacity: if (newLength > 0) { newLength } else { None })
        append(content)
    }

    public func reverse() {
        return StringBuilder(toString().toArray().reverse().toString())
    }

    public func get(i: Int64): ?Char {
        return Char(toString()[i])
    }

    // Warning!
    // The function doesn't consider charset change for char -> Char, java.lang.String -> std$core.String
    // and java.lang.StringBuilder -> std$core.StringBuilder
    // Semantic preservation is guaranteed only for ASCII-defined characters
    // To Be Reimplemented
    public func insert(index: Int64, ch: Char): StringBuilder {
        let asString = toString()
        let incSize = size + 1
        reset(capacity: incSize)
        let content = String(Array<Char>(incSize) {
            i => if (i == index) { ch }
                 else if (i < index) { Char(asString[i]) }
                 else { Char(asString[i - 1]) }
        })
        append(content)
        return this
    }

    // Warning!
    // The function doesn't consider charset change for char -> Char, java.lang.String -> std$core.String
    // and java.lang.StringBuilder -> std$core.StringBuilder
    // Semantic preservation is guaranteed only for strings of ASCII-defined characters
    // To Be Reimplemented
    public func replace(start: Int64, end: Int64, str: String): StringBuilder {
        let asString = toString()
        let incSize = max(capacity, size + str.size)
        reset(capacity: incSize)
        append(asString[..start])
        append(str)
        append(asString[end..])
        this
    }

    // Warning!
    // The function doesn't consider charset change for char -> Char, java.lang.String -> std$core.String
    // and java.lang.StringBuilder -> std$core.StringBuilder
    // Semantic preservation is guaranteed only for string builders of ASCII-defined characters
    // To Be Reimplemented
    public func deleteCharAt(index: Int64): StringBuilder {
        let asString = toString()
        reset(capacity: capacity)
        append(asString[..index])
        append(asString[index + 1..])
        this
    }
}

public interface J2CjOrderingExtension {}

extend Ordering <: J2CjOrderingExtension {
    public func value(): Int32 {
        return match (this) {
            case LT => -1
            case GT => 1
            case EQ => 0
        }
    }
}

public interface J2CjStringExtension {}

extend String <: J2CjStringExtension {
    public func equals(other: String): Bool {
        return this == other
    }

    public func equals(other: ?String): Bool {
        return match (other) {
            case Some(o) => this == o
            case None => false
        }
    }
}
