import Foundation

internal extension String {
    internal var digitsOnly: String {
        return components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
    }
    
    internal var hasOnlyDigits: Bool {
        return rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil
    }
}

internal extension NSMutableString {
    internal var count: Int {
        return (self as String).characters.count
    }
}
