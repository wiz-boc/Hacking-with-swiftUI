//
//  ContentView.swift
//  CoreDataProject
//
//  Created by wizz on 2/17/22.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [], predicate: NSPredicate(format: "universe == %@", "Star Wars")) var ships: FetchedResults<Ship>
    
    var body: some View {
        VStack{
            List(ships, id: \.self){ ship in
                Text(ship.name ?? "Unknown")
            }
            Button("Add"){
                let ship1 = Ship(context: moc)
                ship1.name = "Enterprise"
                ship1.universe = "Star trek"
                
                let ship2 = Ship(context: moc)
                ship2.name = "Defiant"
                ship2.universe = "Star wars"
                
                let ship3 = Ship(context: moc)
                ship3.name = "Millennium"
                ship3.universe = "Star wars"
                
                let ship4 = Ship(context: moc)
                ship4.name = "Executor"
                ship4.universe = "Star wars"
                
                
            }
            Button("Save"){
                do {
                    try moc.save()
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
