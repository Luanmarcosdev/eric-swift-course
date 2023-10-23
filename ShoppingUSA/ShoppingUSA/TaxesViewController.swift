//
//  TaxesViewController.swift
//  ShoppingUSA
//
//  Created by Luan Arruda on 18/10/23.
//

import UIKit

class TaxesViewController: UIViewController {

    @IBOutlet weak var lbDolar: UILabel!
    @IBOutlet weak var lbStateTaxDescription: UILabel!
    @IBOutlet weak var lbStateTax: UILabel!
    @IBOutlet weak var lbIOFDescription: UILabel!
    @IBOutlet weak var lbIOF: UILabel!
    @IBOutlet weak var swCreditCard: UISwitch!
    @IBOutlet weak var lbReal: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        calculeTaxes()
    }
    
    func calculeTaxes() {
        lbDolar.text = tc.getFormattedValue(of: tc.shoppingValue, withCurrency: "U$ ")
        
        let stateTax = tc.getFormattedValue(of: tc.stateTax, withCurrency: "")
        lbStateTaxDescription.text = "Imposto do estado (\(stateTax)% )"
        lbStateTax.text = tc.getFormattedValue(of: tc.stateTaxValue, withCurrency: "U$ ")
        
      
        let iof = tc.getFormattedValue(of: tc.iof, withCurrency: "")
        lbIOFDescription.text = "I.O.F (\(iof)% )"
        lbIOF.text = tc.getFormattedValue(of: tc.iofValue, withCurrency: "U$ ")
        
        
        let totalInDolar = tc.calcule(usingCreditCard: swCreditCard.isOn)
        lbReal.text = tc.getFormattedValue(of: totalInDolar * tc.dolar, withCurrency: "R$ ")
    }
    
    @IBAction func changeIOF(_ sender: UISwitch) {
        calculeTaxes()
    }
    
    
}
