import Foundation

struct CPFCNPJFormatter: Formatter {
    
    func format(value: String) -> String {
        let valueWithoutCharacters = value.digitsOnly
        let count = valueWithoutCharacters.characters.count
        
        if count < 12 {
            return CPFFormatter().format(value: value)
        } else {
            return CNPJFormatter().format(value: value)
        }
    }
    
    func shouldChangeCharacters(of textField: UITextField, inRange range: NSRange, typedText: String) -> Bool {
        let text = (textField.text ?? "").digitsOnly
        let count = text.characters.count
        
        guard count != 12 else {
            textField.text = CPFFormatter().format(value: text)
            return true
        }
        
        if count < 11 {
            return CPFFormatter().shouldChangeCharacters(of: textField, inRange: range, typedText: typedText)
        } else {
            return CNPJFormatter().shouldChangeCharacters(of: textField, inRange: range, typedText: typedText)
        }
    }
}
