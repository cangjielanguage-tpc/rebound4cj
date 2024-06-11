package utils

from std import fs.File
from std import io.ByteArrayStream
from std import io.InputStream
from std import io.OutputStream
from std import io.StringReader

public func getInputStreamFromFile(fileName: String): InputStream {
    var arr = File.readFrom(fileName[1..])
    var inputStream = ByteArrayStream()
    inputStream.write(arr)
    return inputStream
}

public func readByteFromInputStream(inputStream: InputStream): Int32 {
    var arr = Array<Byte>(1, item: 0)
    var readCount = inputStream.read(arr)
    if (readCount == 0) {
        return -1
    }
    return Int32(arr[0])
}

public func readFixedBufferFromInputStream(inputStream: InputStream, buffer: Array<UInt8>, offset: Int32, len: Int32): Int32 {
    var arr = Array<UInt8>(Int64(len), item: 0)
    var readCount = inputStream.read(arr)
    for (i in 0..readCount) {
        buffer[Int64(offset) + i] = arr[i]
    }
    return Int32(readCount)
}

public func writeByteToOutputStream(os: OutputStream, i: Int32) {
    var byte: UInt8 = UInt8(i & 0xff)
    os.write([byte])
}

public func createByteArrayStream(arr: Array<Byte>): ByteArrayStream {
    var bas = ByteArrayStream()
    bas.write(arr)
    return bas
}

public func byteArrayStreamToString(bas: ByteArrayStream): String {
    var stringReader = StringReader(bas)
    return stringReader.readToEnd()
}