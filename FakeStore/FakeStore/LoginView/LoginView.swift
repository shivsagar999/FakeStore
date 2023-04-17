//
//  LoginView.swift
//  FakeStore
//
//  Created by Shivsagar S Wagle on 15/04/23.
//

import SwiftUI
import GoogleSignInSwift

struct LoginView: View {
    
    @State var email: String = ""
    @State var password: String = ""
    
    @State var storeScreen: Bool = false
    @State var invalidCredetialVisible: Bool = false
    @StateObject var loginViewModel = LoginViewModel()
    
    @StateObject var authenticationViewModel: AuthenticationViewModel = AuthenticationViewModel()
    
    var body: some View {
        
        VStack() {
            Spacer()
            
            Text("FakeStore")
                .foregroundColor(.orange)
                .font(
                        .custom(
                        "AmericanTypewriter",
                        fixedSize: 34)
                        .weight(.bold)
                    )

                TextField("Email", text: $email)
                    .padding()
                    .font(.callout)
                    .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.gray).padding(.bottom, -1).padding(.top, -1))
                    .padding()

                SecureField("Password", text: $password)
                    .padding()
                    .font(.callout)
                    .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.gray).padding(.bottom, -1).padding(.top, -1))
                    .padding()
                if invalidCredetialVisible {
                    Text("The username and password you entered is incorrect...❓")
                        .foregroundColor(.red)
                }
                
                
                Button("Login") {
                    Task {
                        do {
                            
                            try await loginViewModel.login(email: self.email, password: self.password)
                            invalidCredetialVisible = false
                            storeScreen.toggle()
                            
                        } catch {
                            invalidCredetialVisible = true
                            print(error)
                        }
                    }
                }
                .padding()
                .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.gray).padding(.bottom, -1).padding(.top, -1))
                .padding()
            
            
            Button {
                
            } label: {
                Text("Login With Google+")
                    .frame(maxWidth: .infinity, maxHeight: 36)
            }
            .padding()
            .buttonStyle(.bordered)
            .tint(.red)
            
            
            
            
   
            Spacer()
            
            Button("Create Account") {
                
            }
        }

        .fullScreenCover(isPresented: $storeScreen) {
            StoreView()
        }
        
        .onAppear() {
            
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
