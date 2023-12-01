//
//  ConsolesManager.swift
//  MyGames
//
//  Created by Luan Arruda on 29/11/23.
//

import Foundation
import CoreData

class ConsolesManager {
    static let shared = ConsolesManager()
    var consoles: [Console] = []
    
    func loadConsoles(with context: NSManagedObjectContext) {
        let fetchRequest = Console.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        do {
            consoles = try context.fetch(fetchRequest)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func deleteConsole(index: Int, context: NSManagedObjectContext) {
        let console = consoles[index]
        context.delete(console)
        do {
            consoles.remove(at: index)
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    private init () {}
}
