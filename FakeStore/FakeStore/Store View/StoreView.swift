//
//  StoreView.swift
//  FakeStore
//
//  Created by Shivsagar S Wagle on 14/04/23.
//

import SwiftUI

struct StoreView: View {
    
    private var symbols = ["keyboard", "hifispeaker.fill", "printer.fill", "tv.fill", "desktopcomputer", "headphones", "tv.music.note", "mic", "plus.bubble", "video"]
    
    private var colors: [Color] = [.yellow, .purple, .green]
    
    private var twoColumnGrid = [GridItem(.flexible()), GridItem(.flexible())]
    
    @StateObject private var storeVM = StoreViewModel()
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: twoColumnGrid) {
                ForEach(storeVM.Data ?? []) { product in
                    VStack(spacing: 10) {
                        AsyncImage(url: URL(string: product.image)) { image in
                            if let image = image {
                                image
                                    .resizable()
                                    .frame(minWidth: 0, maxWidth: .infinity, maxHeight: 150)
                                    .cornerRadius(10)
                            } else
                            {
                                Image(systemName: "plus")
                            }
                        } placeholder: {
                            
                        }
                    }
                }
            }
            .padding()
            .onAppear() {
                Task {
                    await storeVM.LoadStoreData()
                    
                }
                
            }
        }
    }
}

struct StoreView_Previews: PreviewProvider {
    static var previews: some View {
        StoreView()
    }
}
