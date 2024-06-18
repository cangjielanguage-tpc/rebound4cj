package mappings.lang

public interface HashableImpl {
    func hashCodeImpl(): Int64
}

// Open for modification:
// To use another default implementation for hashCode overrides in J2CJ-translated classes,
// change body of the hashCodeImpl() function here.
extend Object <: HashableImpl {
    public func hashCodeImpl(): Int64 {
        // return identityHashCode(this)
        return 0
    }
}