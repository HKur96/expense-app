//
//  Expense_AppApp.swift
//  Expense App
//
//  Created by Mac on 12/9/23.
//

import SwiftUI

@main
struct Expense_AppApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
