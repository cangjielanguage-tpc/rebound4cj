package mappings.lang

from std import math.max
from std import math.min
from std import os.processorCount
from std import os.process.Process
from std import runtime.MemoryInfo
from std import runtime.GC

public class Runtime {

    public static let runtime = Runtime()

    private init() {
    }

    public prop maxMemory: Int64 {
        get() {
            MemoryInfo.maxHeapSize
        }
    }

    public prop totalMemory: Int64 {
        get() {
            MemoryInfo.allocatedHeapSize
        }
    }

    public prop freeMemory: Int64 {
        get() {
            // TODO: request API to fetch proper free memory information
            let totalMemory = this.totalMemory
            max(min(this.maxMemory - totalMemory, totalMemory - 1024), 64)
        }
    }

    public prop availableProcessors: Int32 {
        get() {
            Int32(processorCount())
        }
    }

    public func gc() {
        return GC()
    }

    public func exit(code: Int32): Unit {
        // TODO: shutdown hooks (and don't forget to map System.exit to this method)
        Process.current.exit(Int64(code))
    }
}