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
    
    private var threeColumnGrid = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: threeColumnGrid) {
                ForEach((0...19), id: \.self) { ele in
                    Image(systemName: symbols[(ele % symbols.count)])
                        .font(.system(size: 30))
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 100)
                        .background(colors[ele % colors.count])
                        .cornerRadius(10)
                }
            }
            .padding()
        }
    }
}

struct StoreView_Previews: PreviewProvider {
    static var previews: some View {
        StoreView()
    }
}
