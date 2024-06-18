package utils

from std import convert.Parsable
from std import math.trunc
from std import reflect.TypeInfo
import mappings.lang.HashableImpl

public func arraycopy<T>(src: ?Array<T>, srcPos: Int64, dest: ?Array<T>, destPos: Int64, length: Int64): Unit {
    let srcArray = src.getOrThrow()
    let destArray = dest.getOrThrow()
    destArray[destPos..destPos + length] = srcArray[srcPos..srcPos + length]
}

public func arraycopy<S, T>(src: ?Array<S>, srcPos: Int64, dest: ?Array<T>, destPos: Int64, length: Int64): Unit where S <: T {
    let srcArray = src.getOrThrow()
    let destArray = dest.getOrThrow()
    for (i in 0..length) {
        destArray[destPos + i] = srcArray[srcPos + i]
    }
}

public func indexOfWrap(index: ?Int64): Int32 {
    return match (index) {
        case Some(v) => Int32(v)
        case None => -1
    }
}

public func readWrap(char: ?Char): Int32 {
    return match (char) {
        case Some(c) => Int32(UInt32(c))
        case None => -1
    }
}

public func toString(value: Any): String {
    match (value) {
        case v: AsString => v.asString()
        case v: ToString => v.toString()
        case o: Object => "${TypeInfo.of(value).name}@${o.hashCodeImpl()}"
        case _ => TypeInfo.of(value).name
    }
}

public func parse<T>(data: String): T where T <: Parsable<T> {
    return parse<T>(data, 10)
}

public func parse<T>(data: String, radix: Int32): T where T <: Parsable<T> {
    var dataWithRadixPrefix = match (radix) {
        case 2  => "0b" + data
        case 8  => "0o" + data
        case 16 => "0x" + data
        case _ => data
    }
    return match (T.tryParse(dataWithRadixPrefix)) {
        case Some(v) => v
        case None => throw Exception("Cannot parse String")
    }
}

func iterableToStringArray<T>(elements: Iterable<T>): Array<String> {
    let list = ArrayList<String>()
    for (element in elements) {
        list.append(toString(element))
    }
    return list.toArray()
}

public func join<T>(delimiter: String, elements: Iterable<T>): String {
    let arr = match (elements) {
        case coll: Collection<T> =>
            let iterator = coll.iterator()
            Array<String>(coll.size) { _ => toString(iterator.next().getOrThrow()) }
        case _ => iterableToStringArray(elements)
    }
    return String.join(arr, delimiter: delimiter)
}

public func ushr(n: Int32, s: Int32): Int32 {
    let maskedShift = s & 0x1f
    return Int32(UInt32(n) >> maskedShift)
}

public func ushr(n: Int64, s: Int64): Int64 {
    let maskedShift = s & 0x3f
    return Int64(UInt64(n) >> maskedShift)
}

public func shr(n: Int32, s: Int32): Int32 {
    return n >> (s & 0x1f)
}

public func shr(n: Int64, s: Int64): Int64 {
    return n >> (s & 0x3f)
}

public func shr(n: Int64, s: Int32): Int64 {
    return n >> (s & 0x3f)
}

public func shl(n: Int32, s: Int32): Int32 {
    return n << (s & 0x1f)
}

public func shl(n: Int64, s: Int64): Int64 {
    return n << (s & 0x3f)
}

public func shl(n: Int64, s: Int32): Int64 {
    return n << (s & 0x3f)
}

public func rem(n: Float16, d: Float16): Float16 {
    // TODO: correct implementation of fmod
    return n - trunc(n / d) * d;
}

public func rem(n: Float32, d: Float32): Float32 {
    // TODO: correct implementation of fmod
    return n - trunc(n / d) * d;
}

public func rem(n: Float64, d: Float64): Float64 {
    // TODO: correct implementation of fmod
    return n - trunc(n / d) * d;
}