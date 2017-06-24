//
//  PhoneFormatter.swift
//  Pods
//
//  Created by Cristian Madrid on 22/06/17.
//
//

import Foundation

struct PhoneFormatter: Formatter {
    
    func format(value: String) -> String {
        let valueWithoutCharacters = removeSpecialCharacters(of: value)
        let formattedString = NSMutableString(string: valueWithoutCharacters)
        let count = valueWithoutCharacters.characters.count
        
        if count >= 0 {
            formattedString.insert("(", at: 0)
        }
        if count > 1 {
            formattedString.insert(") ", at: 3)
        }
        if count > 6 {
            formattedString.insert("-", at: 10)
        }
        return formattedString as String
    }
    
    func shouldChangeCharacters(of textField: UITextField, inRange range: NSRange) -> Bool {
        return shouldChangeCharacters(of: textField, inRange: range, withLimit: 15)
    }
}
