//
//  Peace_InsideApp.swift
//  Peace Inside
//
//  Created by Tipu Sultan on 4/7/25.
//

import SwiftUI

@main
struct Peace_InsideApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
//            ContentView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
            
            HomeView()
        }
    }
}
