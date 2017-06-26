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

    @IBOutlet weak var txtCPF: UITextField!
    @IBOutlet weak var txtCNPJ: UITextField!
    @IBOutlet weak var txtCPFCNPJ: UITextField!
    @IBOutlet weak var txtCEP: UITextField!
    @IBOutlet weak var txtPhone: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == txtCPF {
            return GeneralFormatter.cpf.formatTextField(_: textField, shouldChangeCharactersIn: range, replacementString: string)
        } else if textField == txtCNPJ {
            return GeneralFormatter.cnpj.formatTextField(_: textField, shouldChangeCharactersIn: range, replacementString: string)
        } else if textField == txtCPFCNPJ {
            return GeneralFormatter.cpfCnpj.formatTextField(_: textField, shouldChangeCharactersIn: range, replacementString: string)
        } else if textField == txtCEP {
            return GeneralFormatter.cep.formatTextField(_: textField, shouldChangeCharactersIn: range, replacementString: string)
        } else if textField == txtPhone {
            return GeneralFormatter.phone.formatTextField(_: textField, shouldChangeCharactersIn: range, replacementString: string)
        }
        return true
    }
}

