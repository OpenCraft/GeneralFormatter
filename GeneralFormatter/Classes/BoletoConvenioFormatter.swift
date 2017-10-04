//
//  BoletoConvenioFormatter.swift
//  GeneralFormatter
//
//  Created by Luis Filipe Campani on 10/3/17.
//

import Foundation

struct BoletoConvenioFormatter: CustomFormatter {

    func format(value: String) -> String {
        let firstChar = value.digitsOnly.characters.first

        if firstChar == "8" {
            return ConvenioFormatter().format(value: value)
        } else {
            return BoletoFormatter().format(value: value)
        }
    }

    func shouldChangeCharacters(of textField: UITextField, inRange range: NSRange, typedText: String) -> Bool {
        let firstChar = (textField.text ?? "").digitsOnly.characters.first

        if firstChar == "8" {
            return ConvenioFormatter().shouldChangeCharacters(of: textField, inRange: range, typedText: typedText)
        } else {
            return BoletoFormatter().shouldChangeCharacters(of: textField, inRange: range, typedText: typedText)
        }
    }
}
