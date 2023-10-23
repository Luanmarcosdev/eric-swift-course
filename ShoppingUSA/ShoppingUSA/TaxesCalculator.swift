//
//  TaxesCalculator.swift
//  ShoppingUSA
//
//  Created by Luan Arruda on 20/10/23.
//

import Foundation

class TaxesCalculator {
    
    static let shared = TaxesCalculator()
    var dolar: Double = 5.0
    var iof: Double = 6.38
    var stateTax: Double = 7.0
    var shoppingValue: Double = 0
    
    let formatter = NumberFormatter()
    
    var shoppingValueInReal: Double {
        return shoppingValue * dolar
    }
    
    var stateTaxValue: Double {
        return shoppingValue * (stateTax/100)
    }
    
    var iofValue: Double {
        return shoppingValue > 0 ? (shoppingValue + stateTax) * (iof/100) : 0
    }
    
    func calcule(usingCreditCard: Bool) -> Double {
        var finalValue = shoppingValue + stateTaxValue
        if usingCreditCard{
            finalValue += iofValue
        }
      return finalValue //* dolar ?
    }

    func convertToDouble(_ string: String) -> Double {
        formatter.numberStyle = .none
        return formatter.number(from: string)!.doubleValue
    }
    
    func getFormattedValue(of value: Double, withCurrency currency: String) -> String {
        formatter.numberStyle = .currency
        formatter.currencySymbol = currency
        formatter.alwaysShowsDecimalSeparator = true
        return formatter.string(for: value)!
    }
    
    private init(){
        formatter.usesGroupingSeparator = true
    }
}
