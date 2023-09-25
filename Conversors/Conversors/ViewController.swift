//
//  ViewController.swift
//  Conversors
//
//  Created by Luan Arruda on 21/09/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var lbUnity: UILabel!
    @IBOutlet var tfValue: UITextField!
    @IBOutlet var btUnit1: UIButton!
    @IBOutlet var btUnit2: UIButton!
    @IBOutlet var lbResult: UILabel!
    @IBOutlet var lbResultUnit: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func showNext(_ sender: UIButton) {
        switch lbUnity.text! {
        case "Temperatura":
            lbUnity.text = "Peso"
            btUnit1.setTitle("Kilograma", for: .normal)
            btUnit2.setTitle("Libra", for: .normal)
        case "Peso":
            lbUnity.text = "Moeda"
            btUnit1.setTitle("Real", for: .normal)
            btUnit2.setTitle("Dolar", for: .normal)
        case "Moeda":
            lbUnity.text = "Distância"
            btUnit1.setTitle("Metro", for: .normal)
            btUnit2.setTitle("Kilômetro", for: .normal)
        default:
            lbUnity.text = "Temperatura"
            btUnit1.setTitle("Celsius", for: .normal)
            btUnit2.setTitle("Ferinheight", for: .normal)
        }
        convert(nil)
    }
    
    @IBAction func convert(_ sender: UIButton?) {
        if let sender = sender {
            if sender == btUnit1 {
                btUnit2.alpha = 0.5
            }else{
                btUnit1.alpha = 0.5
            }
            sender.alpha = 1.0
        }
        switch lbUnity.text! {
        case "Temperatura":
            calcTemperature()
        case "Peso":
            calcWeight()
        case "Moeda":
            calcCurrency()
        default:
            calcDistance()
        }
        let result = Double(lbResult.text!)!
        lbResult.text = String(format: "%.2f", result)
    }
    
    func calcTemperature() {
        guard let temperature = Double(tfValue.text!) else {return}
        if btUnit1.alpha == 1.0 {
            lbResultUnit.text = "Ferinheight"
            lbResult.text = String(temperature * 1.8 + 32.0)
        }else {
            lbResultUnit.text = "Celcius"
            lbResult.text = String((temperature - 32.0) / 1.8)
        }
    }
    
    func calcWeight() {
        guard let weight = Double(tfValue.text!) else {return}
        if btUnit1.alpha == 1.0 {
            lbResultUnit.text = "Libra"
            lbResult.text = String(weight / 2.2046)
        }else {
            lbResultUnit.text = "Kilograma"
            lbResult.text = String(weight * 2.2046)
        }
    }
    
    func calcCurrency() {
        guard let currency = Double(tfValue.text!) else {return}
        if btUnit1.alpha == 1.0 {
            lbResultUnit.text = "Dólar"
            lbResult.text = String(currency / 5)
        }else {
            lbResultUnit.text = "Real"
            lbResult.text = String(currency * 5)
        }
    }
    
    func calcDistance() {
        guard let distance = Double(tfValue.text!) else {return}
        if btUnit1.alpha == 1.0 {
            lbResultUnit.text = "Kilômetros"
            lbResult.text = String(distance / 1000)
        }else {
            lbResultUnit.text = "Metros"
            lbResult.text = String(distance * 1000)
        }
    }
}


