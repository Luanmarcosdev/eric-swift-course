//
//  ViewController+CoreData.swift
//  MyGames
//
//  Created by Luan Arruda on 27/11/23.
//

import UIKit
import CoreData

extension UIViewController {
    var context: NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
}
