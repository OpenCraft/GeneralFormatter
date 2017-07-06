//
//  BoletoFormatter.swift
//  Pods
//
//  Created by Juliano Rotta on 06/07/17.
//
//

import Foundation

struct BoletoFormatter: Formatter {
    
    func format(value: String) -> String {
        let valueWithoutCharacters = removeSpecialCharacters(of: value)
        let formattedString = NSMutableString(string: valueWithoutCharacters)
        let count = valueWithoutCharacters.characters.count
        
        if count > 4 {
            formattedString.insert(".", at: 5)
        }
        if count > 9 {
            formattedString.insert(" ", at: 11)
        }
        if count > 15 {
            formattedString.insert(".", at: 17)
        }
        if count > 20 {
            formattedString.insert(" ", at: 24)
        }
        if count > 25 {
            formattedString.insert(".", at: 30)
        }
        if count > 31 {
            formattedString.insert(" ", at: 37)
        }
        if count > 32 {
            formattedString.insert(" ", at: 39)
        }
        return formattedString as String
    }
    
    func shouldChangeCharacters(of textField: UITextField, inRange range: NSRange) -> Bool {
        return shouldChangeCharacters(of: textField, inRange: range, withLimit: 54)
    }
}

