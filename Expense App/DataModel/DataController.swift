//
//  DataController.swift
//  Expense App
//
//  Created by Mac on 1/19/24.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "ExpenseTracker")
    
    init () {
        container.loadPersistentStores { description, err in
            if let error = err {
                print("Failed to load data in data controller \(error.localizedDescription)")
            }
        }
    }
}
