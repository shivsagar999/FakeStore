//
//  NoNetworkView.swift
//  FakeStore
//
//  Created by Shivsagar S Wagle on 12/04/23.
//

import SwiftUI

struct NoNetworkView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(spacing: 30){
            Image("No-Internet")
            
            Text("We're sorry, it looks like you're currently not connected to the internet. Please check your Wi-Fi or cellular data connection and try again. ")
                .padding()
            
            Text("If you're still experiencing issues, please wait a few minutes and try again later. If the problem persists, please contact our support team for further assistance.")
                .padding()
            Button("Retry", role: .none) {
                dismiss()
            }
            .buttonStyle(.bordered)
            
        }
        

            
    }
}

struct NoNetworkView_Previews: PreviewProvider {
    static var previews: some View {
        NoNetworkView()
    }
}
