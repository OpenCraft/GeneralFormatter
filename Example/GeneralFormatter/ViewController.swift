//
//  ViewController.swift
//  GeneralFormatter
//
//  Created by Uriel Battanoli on 05/09/2017.
//  Copyright (c) 2017 Uriel Battanoli. All rights reserved.
//

import UIKit
import GeneralFormatter

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}

extension ViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let formatter = GeneralFormatter(type: .cpfCnpj)
        return formatter.formatTextField(textField, shouldChangeCharactersIn: range, replacementString: string)
    }
}

