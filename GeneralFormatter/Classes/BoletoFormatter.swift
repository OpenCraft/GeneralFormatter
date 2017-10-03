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
        let formattedString = NSMutableString(string: value.digitsOnly)
        if value.first == "8" {
            if formattedString.count > 11 {
                formattedString.insert("-", at: 11)
            }
            if formattedString.count > 13 {
                formattedString.insert(" ", at: 13)
            }
            if formattedString.count > 25 {
                formattedString.insert("-", at: 25)
            }
            if formattedString.count > 27 {
                formattedString.insert(" ", at: 27)
            }
            if formattedString.count > 39 {
                formattedString.insert("-", at: 39)
            }
            if formattedString.count > 41 {
                formattedString.insert("-", at: 41)
            }
            if formattedString.count > 53 {
                formattedString.insert("-", at: 53)
            }
        } else {
            if formattedString.count > 5 {
                formattedString.insert(".", at: 5)
            }
            if formattedString.count > 11 {
                formattedString.insert(" ", at: 11)
            }
            if formattedString.count > 17 {
                formattedString.insert(".", at: 17)
            }
            if formattedString.count > 24 {
                formattedString.insert(" ", at: 24)
            }
            if formattedString.count > 30 {
                formattedString.insert(".", at: 30)
            }
            if formattedString.count > 37 {
                formattedString.insert(" ", at: 37)
            }
            if formattedString.count > 39 {
                formattedString.insert(" ", at: 39)
            }
        }
        return formattedString as String
    }
    
    func shouldChangeCharacters(of textField: UITextField, inRange range: NSRange, typedText: String) -> Bool {
        return shouldChangeCharacters(of: textField, inRange: range, typedText: typedText, maxLength: 55)
    }
}

