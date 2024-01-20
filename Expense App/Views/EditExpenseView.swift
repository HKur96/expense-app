//
//  EditExpenseView.swift
//  Expense App
//
//  Created by Mac on 12/9/23.
//

import SwiftUI

struct EditExpenseView: View {
    
    @AppStorage("darkMode") var isDarkMode = false
    
    @Environment(\.managedObjectContext) var managedObjContext
    @Environment(\.dismiss) var dismiss
    var expense: FetchedResults<Expense>.Element
    
    @State private var name = ""
    @State private var amount = ""
    @State private var selectedCategory: String? = nil
    
    let categories = ["Food", "Housing", "Transport",  "Entertainment", "Utilities"]
    
    init (expense: FetchedResults<Expense>.Element) {
        self.expense = expense
        _name = State(initialValue: expense.name ?? "")
        _amount = State(initialValue: String(expense.amount))
        _selectedCategory = State(initialValue: expense.type)
    }
    
    var body: some View {
        VStack {
            GroupBox {
                TextField("Name of Expense", text: $name)
                    .padding()
                    .foregroundColor(.secondary)
                    .background(isDarkMode ? .black : .white)
                    .cornerRadius(10)
                    .shadow(color: .gray, radius: 2, x: 0, y: 2)
                    .padding(.top)
                
                TextField("Amount", text: $amount)
                    .padding()
                    .foregroundColor(.secondary)
                    .background(isDarkMode ? .black : .white)
                    .cornerRadius(10)
                    .shadow(color: .gray, radius: 2, x: 0, y: 2)
                    .padding(.top)
                
                LazyVGrid(columns: [
                    GridItem(.flexible(), spacing: 16),
                    GridItem(.flexible(), spacing: 16),
                    GridItem(.flexible(), spacing: 16)
                ], spacing: 16) {
                    ForEach(categories[0...2], id: \.self) { category in
                        Button {
                            selectedCategory = category
                        } label: {
                            Text(category)
                                .foregroundColor(selectedCategory == category ? .white : .black)
                                .bold()
                                .frame(maxWidth: .infinity, minHeight: 50)
                                .background(selectedCategory == category ? .blue : .white)
                                .cornerRadius(10)
                                .shadow(color: .gray, radius: 2, x: 0, y: 2)
                        }

                    }
                }
                
                LazyVGrid(columns: [
                    GridItem(.flexible(), spacing: 16),
                    GridItem(.flexible(), spacing: 16)
                ], spacing: 16) {
                    ForEach(categories[3...4], id: \.self) { category in
                        Button {
                            selectedCategory = category
                        } label: {
                            Text(category)
                                .foregroundColor(selectedCategory == category ? .white : .black)
                                .bold()
                                .frame(maxWidth: .infinity, minHeight: 50)
                                .background(selectedCategory == category ? .blue : .white)
                                .cornerRadius(10)
                                .shadow(color: .gray, radius: 2, x: 0, y: 2)
                        }

                    }
                }
                
                Button {
                    expense.amount = Double(amount) ?? 0
                    expense.date = Date()
                    expense.id = UUID()
                    expense.name = name
                    expense.type = selectedCategory
                    
                    do {
                        try managedObjContext.save()
                        print("Data saved successfully")
                    } catch {
                        let nsError = error as NSError
                        fatalError("Unresolved error \(nsError)")
                    }
                    
                    dismiss()
                    
                } label: {
                    Text("Save")
                        .foregroundColor(.white)
                        .bold()
                        .frame(maxWidth: .infinity, minHeight: 50)
                        .background(.blue)
                        .cornerRadius(10)
                        .shadow(color: .gray,radius: 2, x:0, y:2)
                }
                .padding()
            }
            .preferredColorScheme(isDarkMode ? .dark : .light)
            
            Spacer()
        }
    }
}
