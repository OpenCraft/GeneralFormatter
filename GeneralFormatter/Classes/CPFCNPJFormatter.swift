//
//  CPFCNPJFormatter.swift
//  Pods
//
//  Created by Cristian Madrid on 22/06/17.
//
//

import Foundation

struct CPFCNPJFormatter: Formatter {
    
    func format(value: String) -> String {
        let valueWithoutCharacters = removeSpecialCharacters(of: value)
        let count = valueWithoutCharacters.characters.count
        
        if count < 12 {
            return CPFFormatter().format(value: value)
        } else {
            return CNPJFormatter().format(value: value)
        }
    }
    
    func shouldChangeCharacters(of textField: UITextField, inRange range: NSRange) -> Bool {
        let text = textField.text ?? ""
        let count = removeSpecialCharacters(of: text).characters.count
        
        guard count != 12 else {
            textField.text = CPFFormatter().format(value: text)
            return true
        }
        
        if count < 11 {
            return CPFFormatter().shouldChangeCharacters(of: textField, inRange: range)
        } else {
            return CNPJFormatter().shouldChangeCharacters(of: textField, inRange: range)
        }
    }
}
