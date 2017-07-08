import Foundation

struct CEPFormatter: Formatter {
    
    func format(value: String) -> String {
        let valueWithoutCharacters = value.digitsOnly
        let formattedString = NSMutableString(string: valueWithoutCharacters)
        let count = valueWithoutCharacters.characters.count
        
        if count > 1 {
            formattedString.insert(".", at: 2)
        }
        if count > 4 {
            formattedString.insert("-", at: 6)
        }
        return formattedString as String
    }
    
    func shouldChangeCharacters(of textField: UITextField, inRange range: NSRange, typedText: String) -> Bool {
        return shouldChangeCharacters(of: textField, inRange: range, typedText: typedText, maxLength: 8)
    }
}
