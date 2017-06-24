//
//  CNPJFormatter.swift
//  Pods
//
//  Created by Cristian Madrid on 22/06/17.
//
//

import Foundation

struct CNPJFormatter: Formatter {
    
    func format(value: String) -> String {
        let valueWithoutCharacters = removeSpecialCharacters(of: value)
        let formattedString = NSMutableString(string: valueWithoutCharacters)
        let count = valueWithoutCharacters.characters.count
        
        if count > 1 {
            formattedString.insert(".", at: 2)
        }
        if count > 4 {
            formattedString.insert(".", at: 6)
        }
        if count > 7 {
            formattedString.insert("/", at: 10)
        }
        if count > 11 {
            formattedString.insert("-", at: 15)
        }
        
        return formattedString as String
    }
    
    func shouldChangeCharacters(of textField: UITextField, inRange range: NSRange) -> Bool {
        return shouldChangeCharacters(of: textField, inRange: range, withLimit: 18)
    }
}
