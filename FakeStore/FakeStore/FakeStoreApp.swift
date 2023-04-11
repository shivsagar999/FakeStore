//
//  FakeStoreApp.swift
//  FakeStore
//
//  Created by Shivsagar S Wagle on 11/04/23.
//

import SwiftUI

@main
struct FakeStoreApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
