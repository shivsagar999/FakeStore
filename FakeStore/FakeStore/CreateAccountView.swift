//
//  CreateAccountView.swift
//  FakeStore
//
//  Created by Shivsagar S Wagle on 17/04/23.
//

import SwiftUI

struct CreateAccountView: View {
    
    @State var email: String = ""
    @State var password: String = ""
    @State var reEnteredPassword: String = ""
    
    @State var passwordNotMatchingErrorVisible = false

    var body: some View {
        
        VStack {
            Text("Create Account")
                .foregroundColor(.blue)
                .font(
                        .custom(
                        "AmericanTypewriter",
                        fixedSize: 34)
                        .weight(.bold)
                    )
            
            Spacer()
            
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
            
            SecureField("Re-enter Password", text: $password)
                .padding()
                .font(.callout)
                .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.gray).padding(.bottom, -1).padding(.top, -1))
                .padding()
            
            if passwordNotMatchingErrorVisible {
                Text("Password are not matching")
                    .foregroundColor(.red)
            }
            
            
            Button("Create Account") {
                
            }
            .padding()
            .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.gray).padding(.bottom, -1).padding(.top, -1))
            .padding()
            
            Spacer()
        
        }
        
    }
}

struct CreateAccountView_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccountView()
    }
}
