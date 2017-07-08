import Foundation

struct CEPFormatter: Formatter {
    
    func format(value: String) -> String {
        let formattedString = NSMutableString(string: value.digitsOnly)
        
        if formattedString.count > 2 {
            formattedString.insert(".", at: 2)
        }
        if formattedString.count > 6 {
            formattedString.insert("-", at: 6)
        }
        
        return formattedString as String
    }
    
    func shouldChangeCharacters(of textField: UITextField, inRange range: NSRange, typedText: String) -> Bool {
        return shouldChangeCharacters(of: textField, inRange: range, typedText: typedText, maxLength: 10)
    }
}
