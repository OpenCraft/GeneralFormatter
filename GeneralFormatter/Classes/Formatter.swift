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
        var currentText = textField.text ?? ""
        if isDigitsOnly {
            currentText = currentText.digitsOnly
        }
        
        if range.length > 0 && typedText.isEmpty {
            return true
        }
        
        if isDigitsOnly && !typedText.hasOnlyDigits {
            return false
        }
        
        guard currentText.characters.count + typedText.characters.count <= maxLength else {
            return false
        }
        
        textField.text = format(value: currentText)
        
        return true
    }
}
