//
//  WinnersTableViewController.swift
//  FIFAWorldCupChampions
//
//  Created by Luan Arruda on 26/10/23.
//

import UIKit

class WinnersTableViewController: UITableViewController {
    
    let worldCupManager = WorldCupManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let viewController = segue.destination as! WorldCupViewController
        
        let worldCup = worldCupManager.worldCups[tableView.indexPathForSelectedRow!.row]
        
        viewController.worldCup = worldCup
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return worldCupManager.worldCups.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! WorldCupTableViewCell
        
        let worldCup = worldCupManager.worldCups[indexPath.row]
        
        cell.prepare(with: worldCup)
        
        return cell
    }

}
