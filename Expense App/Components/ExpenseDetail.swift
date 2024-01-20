//
//  ExpenseDetail.swift
//  Expense App
//
//  Created by Mac on 1/20/24.
//

import SwiftUI

struct ExpenseDetail: View {
    
    var amount: String
    var date: Date
    var name: String
    var type: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .cornerRadius(12)
                .frame(width: 350, height: 75)
                .foregroundColor(.white)
                .shadow(color: .gray, radius: 2, x: 0, y: 2)
            
            HStack(spacing: 16) {
                VStack(alignment: .leading, spacing: 4) {
                    Text(name)
                        .foregroundColor(.black)
                        .font(.headline)
                        .fontWeight(.semibold)
                    
                    Text(type)
                        .foregroundColor(.teal)
                        .font(.system(size: 15))
                        .bold()
                    
                    Text(date, style: .date)
                        .foregroundColor(.gray)
                        .font(.caption)
                }
                .padding()
                
                Spacer()
                
                Text("$\(amount)")
                    .font(.title2)
                    .bold()
                    .foregroundColor(.red)
                    .padding()
            }
            .padding(.horizontal, 16)
        }
    }
}

struct ExpenseDetail_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseDetail(amount: "String", date: Date(), name: "String", type: "String")
    }
}
