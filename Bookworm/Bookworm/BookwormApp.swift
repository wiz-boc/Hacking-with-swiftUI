//
//  BookwormApp.swift
//  Bookworm
//
//  Created by wizz on 2/15/22.
//

import SwiftUI

@main
struct BookwormApp: App {
    @State private var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
