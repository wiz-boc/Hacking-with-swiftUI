//
//  ContentView.swift
//  iExpense
//
//  Created by wizz on 2/5/22.
//

import SwiftUI

//class User: ObservableObject {
//    @Published var firstName = "Bilbo"
//    @Published var lastName = "Baggins"
//}

//struct SecondView: View {
//
//    @Environment(\.dismiss) var dismiss
//
//    let name: String
//    var body: some View {
//        VStack {
//            Button("Exit"){
//                dismiss()
//            }
//            Text("Second view - \(name)")
//        }
//    }
//}

//struct User: Codable {
//    let firstName: String
//    let lastName: String
//}
struct ContentView: View {
    @StateObject var expenses = Expenses()
    @State private var showingAddExpense = false
    //@State private var tapCount = UserDefaults.standard.integer(forKey: "Tap")
    //@AppStorage("tapCount") private var tapCount = 0
//    @State private var user = User(firstName: "Wizz", lastName: "Gayle")
    var body: some View {
        NavigationView{
            List{
                ForEach(expenses.items){ item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }
                        Spacer()
                        Text(item.amount, format: .currency(code: "USD"))
                    }
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button{
                    showingAddExpense = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
            }

        }
        
    }
    
    func removeItems(at offsets: IndexSet){
        expenses.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
