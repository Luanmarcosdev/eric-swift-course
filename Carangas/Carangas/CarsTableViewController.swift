//
//  CarsTableViewController.swift
//  Carangas
//
//  Created by Luan Arruda on 21/11/23.
//  Copyright © 2023 Eric Brito. All rights reserved.
//

import UIKit

class CarsTableViewController: UITableViewController {
    
    var cars: [Car] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        REST.loadCars { cars in
            self.cars = cars
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        } onError: { error in
            switch error {
            case .invalidJSON:
                print("JSON inválido.")
            case .noData:
                print("Sem nenhum JSON.")
            case .noResponse:
                print("Sem resposta, erro durante a solicitação.")
            case .url:
                print("Erro na URL")
            case .taskError(let error):
                print(error)
            case .responseStatusCode(let code):
                print("Status Code \(code)")
            }
        }
    }
    
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cars.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let car = cars[indexPath.row]
        cell.textLabel?.text = car.name
        cell.detailTextLabel?.text = car.brand
        
        
        return cell
    }
    
}
