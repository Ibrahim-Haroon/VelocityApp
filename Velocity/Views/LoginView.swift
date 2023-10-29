//
//  LoginView.swift
//  Velocity
//
//  Created by Ibrahim Haroon on 10/28/23.
//

import SwiftUI

struct LoginView: View {
    @State var email: String = "";
    @State var password: String = "";
    
    var body: some View {
        NavigationView {
            VStack {
                // Header
                HeaderView(title: "Velocity", titleSize: 50, subtitle: "Conquer your tasks", subtitleSize: 30, backgroundColor: .black)
                
                // Login Form
                Form {
                    TextField("Email Address", text: $email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    SecureField("Password", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    VButton(buttonText: "Login", backgroundColor: .blue) {
                        // Attempt login
                    }
                }
                
                // Create Account
                VStack {
                    Text("New?")
                    NavigationLink("Create an Account", destination: RegisterView())
                }
                .padding(.bottom, 30)
            }
        }
    }
}

#Preview {
    LoginView()
}
