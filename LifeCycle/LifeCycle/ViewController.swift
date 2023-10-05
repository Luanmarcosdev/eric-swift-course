//
//  ViewController.swift
//  LifeCicle
//
//  Created by Luan Arruda on 05/10/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("tela 1 : viewDidLoad")
        label.text = "Entre com seu nome"
        //tela carregou
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("tela 1 : viewWillAppear")
        //tela aparecerá
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("tela 1 : viewDidAppear")
        //tela apareceu
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("tela 1 : viewWillDisappear")
        //tela desaparecerá
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("tela 1 : viewDidDisappear")
        label.text = textField.text
        textField.text = " "
        //tela desapareceu
    }


}

