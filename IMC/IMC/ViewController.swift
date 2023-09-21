//
//  ViewController.swift
//  IMC
//
//  Created by Luan Arruda on 20/09/23.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var tfWeight: UITextField!
    @IBOutlet var tfHeight: UITextField!
    @IBOutlet var lbResult: UILabel!
    @IBOutlet var ivResult: UIImageView!
    @IBOutlet var viResult: UIView!
    
    var imc: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func calculate(_ sender: Any) {
        if let weight = Double(tfWeight.text!), let height = Double(tfHeight.text!){
            imc = weight / (height * height)
            showResults()
        }
    }
    
    func showResults() {
        var result: String
        var image: String
        
        switch imc {
            case 0..<16:
                result = "Magreza"
                image = "abaixo"
            case 16..<18.5:
                result = "Abaixo do Peso"
                image = "abaixo"
            case 18.5..<25:
                result = "Peso Ideal"
                image = "ideal"
            case 25..<30:
                result = "Sobrepeso"
                image = "sobre"
            default:
                result = "Obesidade"
                image = "obesidade"
        }
        
        lbResult.text = "\(Int(imc)): \(result)"
        ivResult.image = UIImage(named: image)
        viResult.isHidden = false
    }
}

