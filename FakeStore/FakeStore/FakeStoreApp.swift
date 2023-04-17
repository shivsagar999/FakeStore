//
//  FakeStoreApp.swift
//  FakeStore
//
//  Created by Shivsagar S Wagle on 11/04/23.
//

import SwiftUI
import Firebase
import GoogleSignIn

@main
struct FakeStoreApp: App {
    let persistenceController = PersistenceController.shared

    init() {
        setupAuthentication()
      }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
            
                .onOpenURL { url in
                    GIDSignIn.sharedInstance.handle(url)
                }
                
        }
    }
}

extension FakeStoreApp {
    
  private func setupAuthentication() {
    FirebaseApp.configure()
  }
}
