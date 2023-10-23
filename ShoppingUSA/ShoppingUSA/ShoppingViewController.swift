//
//  ViewController.swift
//  ShoppingUSA
//
//  Created by Luan Arruda on 18/10/23.
//

import UIKit

class ShoppingViewController: UIViewController {

    @IBOutlet weak var tfDolar: UITextField!
    @IBOutlet weak var lbRealDescription: UILabel!
    @IBOutlet weak var lbReal: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setAmmount()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        tfDolar.resignFirstResponder()
        setAmmount()
    }
    
    func setAmmount() {
        tc.shoppingValue = tc.convertToDouble(tfDolar.text!)
        let dolarToday = tc.getFormattedValue(of: tc.dolar, withCurrency: "US$ ")
        lbRealDescription.text = "Valor sem impostos (1US$ = \(dolarToday))"
        lbReal.text = tc.getFormattedValue(of: tc.shoppingValue * tc.dolar, withCurrency: "R$ ")
    }

}

