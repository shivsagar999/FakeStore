//
//  LoginView.swift
//  FakeStore
//
//  Created by Shivsagar S Wagle on 15/04/23.
//

import SwiftUI

struct LoginView: View {
    
    @State var email: String = ""
    @State var password: String = ""
    
    @State var storeScreen: Bool = false
    
    @StateObject var loginViewModel = LoginViewModel()
    
    var body: some View {
        
        VStack(spacing: 100) {
            Text("FakeStore")
                .foregroundColor(.orange)
                .font(
                        .custom(
                        "AmericanTypewriter",
                        fixedSize: 34)
                        .weight(.bold)
                    )
            VStack() {
                TextField("Email", text: $email)
                    .padding()
                    .font(.callout)
                    .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.gray).padding(.bottom, -1).padding(.top, -1))
                    .padding()

                TextField("Password", text: $password)
                    .padding()
                    .font(.callout)
                    .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.gray).padding(.bottom, -1).padding(.top, -1))
                    .padding()
                
                Button("Login") {
                    Task {
                        do {
                            try await loginViewModel.login(email: self.email, password: self.password)
                            storeScreen.toggle()
                        } catch {
                            print(error)
                        }
                    }
                    
                }
                .padding()
                .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.gray).padding(.bottom, -1).padding(.top, -1))
                .padding()
            }
            
        }
        
        .fullScreenCover(isPresented: $storeScreen) {
            StoreView()
        }
        
        
        
        
        
        // MULTILINE TEXTFIELD WITH BORDERS
//        TextField(
//            "Enter First Name..",
//            text: $firstName,
//            axis: .vertical
//
//        )
//        .padding()
//        .font(.title3)
//        .textInputAutocapitalization(.never)
//        .lineLimit(1...10)
//        .disableAutocorrection(true)
//        .cornerRadius(10)
//        .lineLimit(4)
//        .multilineTextAlignment(.leading)
//        .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.gray).padding(.bottom, -10).padding(.top, -10))
//        .padding()
//
        
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
