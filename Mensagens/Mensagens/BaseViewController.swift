//
//  BaseViewController.swift
//  Mensagens
//
//  Created by Luan Arruda on 12/10/23.
//  Copyright © 2023 Eric Brito. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    @IBOutlet weak var lbMessage: UILabel!
    var message: Message!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func changeColor(_ sender: UIButton){
        
        if let reference = self as? ColorPickerDelegate {
            // instancia a View através da Idetify Storyboard ID
            let colorPicker = storyboard?.instantiateViewController(withIdentifier: "ColorPickerViewController") as! ColorPickerViewController
            colorPicker.delegate = reference
            // método para apresentar a view instanciada na constante colorPicker
            present(colorPicker, animated: true)
        }
    }


}
