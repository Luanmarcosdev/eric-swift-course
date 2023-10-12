//
//  ViewController.swift
//  Mensagens
//
//  Copyright © 2017 Eric Brito. All rights reserved.
//

import UIKit

class MessageViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        message = Message()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! MessageColorViewController
        vc.message = self.message
    }
    
        
}

extension MessageViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        message.text = textField.text!
        print(message.text!)
        lbMessage.text = textField.text!
        print(lbMessage.text!)
        textField.resignFirstResponder() //esconde teclado
        
        return true
    }
}

extension MessageViewController: ColorPickerDelegate {
    func applyColor(color: UIColor) {
        lbMessage.textColor = color
        message.textColor = color
    }

}
