//
//  ViewController.swift
//  SuperPassword
//
//  Created by Luan Arruda on 05/10/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfTotalPasswords: UITextField!
    @IBOutlet weak var tfNumberOfCharacters: UITextField!
    @IBOutlet weak var swLetters: UISwitch!
    @IBOutlet weak var swNumbers: UISwitch!
    @IBOutlet weak var swCapitalLetters: UISwitch!
    @IBOutlet weak var swSpecialCharacters: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //esse metodo é sempre exeutado momentos antes da segue apresentar a nova tela, é com ele que passamos informacoes de uma ViewController para outra.
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //como já sabemos para qual ViewController estamos enviando essas informacoes, usamos o typecasting para conseguir manipular os atributos da outra ViewController
        
        let passwordsViewController = segue.destination as! PasswordsViewController
        
        // desembrulhamos para nao enviar valor nil
        
        if let numberOfPasswords = Int(tfTotalPasswords.text!) {
            passwordsViewController.numberOfPasswords = numberOfPasswords
        }
        
        if let numberOfCharacters = Int(tfNumberOfCharacters.text!) {
            passwordsViewController.numberOfCharacters = numberOfCharacters
        }
        
        passwordsViewController.useLetters = swLetters.isOn
        passwordsViewController.useNumbers = swNumbers.isOn
        passwordsViewController.useCapitalLetters = swCapitalLetters.isOn
        passwordsViewController.useSpecialCharacters = swSpecialCharacters.isOn
       
        //metodo usado para encerrar a edicao da View
        view.endEditing(true)
        
    }


}

