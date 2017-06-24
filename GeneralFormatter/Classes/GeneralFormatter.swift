//
//  AgiplanFormatter.swift
//  Agipag
//
//  Created by Uriel Battanoli on 02/05/17.
//  Copyright © 2017 Banco Agiplan. All rights reserved.
//

import Foundation

public enum GeneralFormatter {
    
    case cpf
    case cnpj
    case cpfCnpj
    case phone
    case cep
    
    var formatter: Formatter {
        switch self {
        case .cpf:
            return CPFFormatter()
        case .phone:
            return PhoneFormatter()
        case .cep:
            return CEPFormatter()
        case .cnpj:
            return CNPJFormatter()
        case .cpfCnpj:
            return CPFCNPJFormatter()
        }
    }
    
    public func formatTextField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return formatter.shouldChangeCharacters(of: textField, inRange: range)
    }
}
