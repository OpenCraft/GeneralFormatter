import Foundation

struct CPFCNPJFormatter: Formatter {
    
    func format(value: String) -> String {
        let count = value.digitsOnly.characters.count
        
        if count <= 11 {
            return CPFFormatter().format(value: value)
        } else {
            return CNPJFormatter().format(value: value)
        }
    }
    
    func shouldChangeCharacters(of textField: UITextField, inRange range: NSRange, typedText: String) -> Bool {
        let count = (textField.text ?? "").digitsOnly.characters.count
        
        if count < 11 {
            return CPFFormatter().shouldChangeCharacters(of: textField, inRange: range, typedText: typedText)
        } else {
            return CNPJFormatter().shouldChangeCharacters(of: textField, inRange: range, typedText: typedText)
        }
    }
}
