//
//  Formatter.swift
//  Pods
//
//  Created by Cristian Madrid on 22/06/17.
//
//

import Foundation

public protocol Formatter {
    func format(value: String) -> String
    func shouldChangeCharacters(of textField: UITextField, inRange range: NSRange, typedText: String) -> Bool
}

extension Formatter {
    func shouldChangeCharacters(of textField: UITextField, inRange range: NSRange, typedText: String, maxLength: Int, isDigitsOnly: Bool = true) -> Bool {
        let currentText = NSString(string: textField.text ?? "")
        
        var result = format(value: currentText.replacingCharacters(in: range, with: typedText))
        
        if result.characters.count > maxLength {
            result = result.substring(to: result.index(result.startIndex, offsetBy: maxLength))
        }
        
        textField.text = result
        textField.sendActions(for: .editingChanged)
        
        return false
    }
}
