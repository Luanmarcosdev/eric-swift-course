//
//  CarViewController.swift
//  Carangas
//
//  Created by Luan Arruda on 21/11/23.
//  Copyright © 2023 Eric Brito. All rights reserved.
//

import UIKit
import WebKit
import Foundation

class CarViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var lbBrand: UILabel!
    @IBOutlet weak var lbGasType: UILabel!
    @IBOutlet weak var lbPrice: UILabel!
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var loading: UIActivityIndicatorView!
    
    // MARK: - Properties

    var car: Car!
    
    // MARK: - Super Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = car.name
        lbBrand.text = car.brand
        lbGasType.text = car.gas
        lbPrice.text = "R$ \(car.price)"
        
        let name = (title! + "+" + car.brand).replacingOccurrences(of: " ", with: "+")
        let URLString = "https://www.google.com.br/search?q=\(name)&tbm=isch"
        let url = URL(string: URLString)!
        let request = URLRequest(url: url)
        
        webView.allowsBackForwardNavigationGestures = true
        webView.allowsLinkPreview = true
        webView.navigationDelegate = self
        webView.uiDelegate = self
        webView.load(request)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "editSegue" {
            let viewController = segue.destination as! AddEditViewController
            viewController.car = self.car
        }
    }

}

extension CarViewController: WKNavigationDelegate, WKUIDelegate{
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        loading.stopAnimating()
    }
}
