//
//  ContentView.swift
//  FakeStore
//
//  Created by Shivsagar S Wagle on 11/04/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @State private var noNetworkScreen: Bool = false
    @State private var storeScreen: Bool = false
    
    
    var body: some View {
        Text("FakeStore")
            .foregroundColor(.orange)
            .font(
                    .custom(
                    "AmericanTypewriter",
                    fixedSize: 34)
                    .weight(.bold)
                )
            .fullScreenCover(isPresented: $noNetworkScreen) {
                NoNetworkView()
            }
            .fullScreenCover(isPresented: $storeScreen) {
                StoreView()
            }
            .onAppear {
                checkForNetwork()
            }
        
        
    }

    func checkForNetwork() {
        FSNetworkStatus.shared.initiateNetworkStatusHandler { isConnected in
            if isConnected {
                storeScreen.toggle()
            } else {
                FSNetworkStatus.shared.networkStatusChangeHandler = { isConnected in
                    if isConnected {
                        storeScreen.toggle()
                    }
                    
                }
                noNetworkScreen.toggle()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
