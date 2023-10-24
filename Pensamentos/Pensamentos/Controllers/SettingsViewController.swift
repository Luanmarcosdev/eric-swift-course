//
//  SettingsViewController.swift
//  Pensamentos
//
//  Created by Luan Arruda on 24/10/23.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var swAutorefresh: UISwitch!
    @IBOutlet weak var slTimeInterval: UISlider!
    @IBOutlet weak var scColorScheme: UISegmentedControl!
    @IBOutlet weak var lbTimeInterval: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func changeAutorefresh(_ sender: UISwitch) {
    }
    
    @IBAction func changeTimeInterval(_ sender: UISlider) {
    }
    
    @IBAction func changeColorScheme(_ sender: UISegmentedControl) {
    }
    
}
