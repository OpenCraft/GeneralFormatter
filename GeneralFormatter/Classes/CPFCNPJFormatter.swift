import Foundation

struct CPFCNPJFormatter: CustomFormatter {
    
    func format(value: String) -> String {
        let count = value.digitsOnly.count
        
        if count <= 11 {
            return CPFFormatter().format(value: value)
        } else {
            return CNPJFormatter().format(value: value)
        }
    }
    
    func shouldChangeCharacters(of textField: UITextField, inRange range: NSRange, typedText: String) -> Bool {
        let text = (textField.text ?? "") as NSString
        let newText = text.replacingCharacters(in: range, with: typedText)
        
        if newText.digitsOnly.count <= 11 {
            return CPFFormatter().shouldChangeCharacters(of: textField, inRange: range, typedText: typedText)
        } else {
            return CNPJFormatter().shouldChangeCharacters(of: textField, inRange: range, typedText: typedText)
        }
    }
}
