import Foundation

struct CPFFormatter: Formatter {
    
    func format(value: String) -> String {
        let valueWithoutCharacters = value.digitsOnly
        let formattedString = NSMutableString(string: valueWithoutCharacters)
        let count = valueWithoutCharacters.characters.count
        
        if count > 2 {
            formattedString.insert(".", at: 3)
        }
        if count > 5 {
            formattedString.insert(".", at: 7)
        }
        if count > 8 {
            formattedString.insert("-", at: 11)
        }
        return formattedString as String
    }

    func shouldChangeCharacters(of textField: UITextField, inRange range: NSRange, typedText: String) -> Bool {
        return shouldChangeCharacters(of: textField, inRange: range, typedText: typedText, maxLength: 11)
    }
}
