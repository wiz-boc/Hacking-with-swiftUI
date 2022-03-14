//
//  ExpenseItem.swift
//  iExpense
//
//  Created by wizz on 2/5/22.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
