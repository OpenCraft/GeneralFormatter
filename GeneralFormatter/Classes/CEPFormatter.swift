import Foundation

struct CEPFormatter: Formatter {
    
    func format(value: String) -> String {
        let valueWithoutCharacters = removeSpecialCharacters(of: value)
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
    
    func shouldChangeCharacters(of textField: UITextField, inRange range: NSRange) -> Bool {
        return shouldChangeCharacters(of: textField, inRange: range, withLimit: 10)
    }
}
