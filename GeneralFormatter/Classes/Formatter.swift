//
//  Formatter.swift
//  Pods
//
//  Created by Cristian Madrid on 22/06/17.
//
//

import Foundation

protocol Formatter {
    func format(value: String) -> String
    func shouldChangeCharacters(of textField: UITextField, inRange range: NSRange) -> Bool
}

extension Formatter {
    func removeSpecialCharacters(of value: String) -> String {
        var string = value.replacingOccurrences(of: ".", with: "")
        string = string.replacingOccurrences(of: "/", with: "")
        string = string.replacingOccurrences(of: "-", with: "")
        string = string.replacingOccurrences(of: "(", with: "")
        string = string.replacingOccurrences(of: ")", with: "")
        string = string.replacingOccurrences(of: " ", with: "")
        
        return string
    }
    
    func shouldChangeCharacters(of textField: UITextField, inRange range: NSRange, withLimit limit: Int) -> Bool {
        let text = textField.text ?? ""
        guard text.characters.count < limit else {
            if range.location < limit {
                return true
            }
            return false
        }
        if range.location >= text.characters.count {
            textField.text = format(value: text)
        }
        return true
    }
}
