//
//  ContentView.swift
//  Expense App
//
//  Created by Mac on 12/9/23.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            ExpenseView()
                .tabItem {
                    Image(systemName: "dollarsign")
                    Text("Expenses")
                }
            
            AddExpenseView()
                .tabItem {
                    Image(systemName: "plus")
                    Text("Add Expense")
                }
            
            SettingsView()
                .tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
