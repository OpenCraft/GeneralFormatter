//
//  AgiplanFormatter.swift
//  Agipag
//
//  Created by Uriel Battanoli on 02/05/17.
//  Copyright © 2017 Banco Agiplan. All rights reserved.
//

import Foundation


public class GeneralFormatter {
    
    public enum InfoType {
        case cpfCnpj
        case phone
        case cep
    }
    
    private let type: InfoType
    
    public init(type: InfoType) {
        self.type = type
    }
    
    public func formatTextField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        switch type {
        case .cpfCnpj:
            guard let textCount = textField.text?.characters.count, textCount < 18 else {
                if range.location < 18 {
                    return true
                }
                return false
            }
            
            if range.location >= textCount {
                textField.text = formattedString(from: textField.textValue)
            } else if textCount == 15 {
                let text = textField.textValue.removeSpecialCharacters()
                textField.text = text.CPFFormatted()
            }
            return true
        case .phone:
            guard let textCount = textField.text?.characters.count, textCount < 15 else {
                if range.location < 15 {
                    return true
                }
                return false
            }
            
            if range.location >= textCount {
                textField.text = formattedString(from: textField.textValue)
            }
            return true
        case .cep:
            guard let textCount = textField.text?.characters.count, textCount < 10 else {
                if range.location < 10 {
                    return true
                }
                return false
            }
            
            if range.location >= textCount {
                textField.text = formattedString(from: textField.textValue)
            }
            return true
        }
    }
    
    public func formattedString(from text: String) -> String {
        switch type {
        case .cpfCnpj:
            return getCpfCnpjFormatted(text)
        case .phone:
            return getPhoneFormatted(text)
        case .cep:
            return getCepFormatted(text)
        }
    }
    
    private func getPhoneFormatted(_ text: String) -> String {
        let bruteText = text.removeSpecialCharacters()
        let formattedString = NSMutableString(string: bruteText)
        let textCount = bruteText.characters.count
        
        if textCount >= 0 {
            formattedString.insert("(", at: 0)
        }
        if textCount > 1 {
            formattedString.insert(") ", at: 3)
        }
        if textCount > 6 {
            formattedString.insert("-", at: 10)
        }
        
        return formattedString as String
    }
    
    private func getCpfCnpjFormatted(_ text: String) -> String {
        let bruteText = text.removeSpecialCharacters()
        let formattedString = NSMutableString(string: bruteText)
        let textCount = bruteText.characters.count
        
        if textCount < 11 {
            if textCount > 2 {
                formattedString.insert(".", at: 3)
            }
            if textCount > 5 {
                formattedString.insert(".", at: 7)
            }
            if textCount > 8 {
                formattedString.insert("-", at: 11)
            }
        } else {
            if textCount > 1 {
                formattedString.insert(".", at: 2)
            }
            if textCount > 4 {
                formattedString.insert(".", at: 6)
            }
            if textCount > 7 {
                formattedString.insert("/", at: 10)
            }
            if textCount > 11 {
                formattedString.insert("-", at: 15)
            }
        }
        
        return formattedString as String
    }
    
    private func getCepFormatted(_ text: String) -> String {
        let bruteText = text.removeSpecialCharacters()
        let formattedString = NSMutableString(string: bruteText)
        let textCount = bruteText.characters.count
        
        if textCount > 1 {
            formattedString.insert(".", at: 2)
        }
        if textCount > 4 {
            formattedString.insert("-", at: 6)
        }
        
        return formattedString as String
    }
}

fileprivate extension String {
    
    func removeSpecialCharacters() -> String {
        var string = self.replacingOccurrences(of: ".", with: "")
        string = string.replacingOccurrences(of: "/", with: "")
        string = string.replacingOccurrences(of: "-", with: "")
        string = string.replacingOccurrences(of: "(", with: "")
        string = string.replacingOccurrences(of: ")", with: "")
        string = string.replacingOccurrences(of: " ", with: "")
        
        return string
    }
    
    func CPFFormatted() -> String? {
        if characters.count >= 11 {
            let formattedString = NSMutableString(string: self)
            formattedString.insert(".", at: 3)
            formattedString.insert(".", at: 7)
            formattedString.insert("-", at: 11)
            return formattedString as String
        }
        return nil
    }
}

fileprivate extension UITextField {
    
    var textValue: String {
        return self.text ?? ""
    }
}
