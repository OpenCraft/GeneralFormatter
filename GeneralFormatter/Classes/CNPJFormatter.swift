import Foundation

struct CNPJFormatter: CustomFormatter {
    
    func format(value: String) -> String {
        let formattedString = NSMutableString(string: value.digitsOnly)
        
        if formattedString.count > 2 {
            formattedString.insert(".", at: 2)
        }
        if formattedString.count > 6 {
            formattedString.insert(".", at: 6)
        }
        if formattedString.count > 10 {
            formattedString.insert("/", at: 10)
        }
        if formattedString.count > 15 {
            formattedString.insert("-", at: 15)
        }
        
        return formattedString as String
    }
    
    func shouldChangeCharacters(of textField: UITextField, inRange range: NSRange, typedText: String) -> Bool {
        return shouldChangeCharacters(of: textField, inRange: range, typedText: typedText, maxLength: 18)
    }

}
