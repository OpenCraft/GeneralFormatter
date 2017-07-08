import Foundation

struct PhoneFormatter: Formatter {
    
    func format(value: String) -> String {
        let valueWithoutCharacters = value.digitsOnly
        let formattedString = NSMutableString(string: valueWithoutCharacters)
        let count = valueWithoutCharacters.characters.count
        
        if count >= 0 {
            formattedString.insert("(", at: 0)
        }
        if count > 1 {
            formattedString.insert(") ", at: 3)
        }
        if count > 6 {
            formattedString.insert("-", at: 10)
        }
        return formattedString as String
    }
    
    func shouldChangeCharacters(of textField: UITextField, inRange range: NSRange, typedText: String) -> Bool {
        return shouldChangeCharacters(of: textField, inRange: range, typedText: typedText, maxLength: 11)
    }
}
