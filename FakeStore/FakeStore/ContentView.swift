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

    var body: some View {
        Text("TYifuyrd")
    }

    private func addItem() {
        
    }

    private func deleteItems(offsets: IndexSet) {
        
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
