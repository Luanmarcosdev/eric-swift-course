//
//  SecondViewController.swift
//  LifeCicle
//
//  Created by Luan Arruda on 05/10/23.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("tela 2 : viewDidLoad")
        //tela carregou
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("tela 2 : viewWillAppear")
        //tela aparecerá
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("tela 2 : viewDidAppear")
        //tela apareceu
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("tela 2 : viewWillDisappear")
        //tela desaparecerá
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("tela 2 : viewDidDisappear")
        //tela desapareceu
    }


}
