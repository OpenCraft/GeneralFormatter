import Foundation

internal extension String {
    var digitsOnly: String {
        return components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
    }
    
    var hasOnlyDigits: Bool {
        return rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil
    }
}

internal extension NSMutableString {
    var count: Int {
        return (self as String).count
    }
}
