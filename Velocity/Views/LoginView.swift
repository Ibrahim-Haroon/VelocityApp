//
//  LoginView.swift
//  Velocity
//
//  Created by Ibrahim Haroon on 10/28/23.
//

import SwiftUI

struct LoginView: View {   
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                // Header
                HeaderView(title: "Velocity", titleSize: 50, subtitle: "Conquer your tasks", subtitleSize: 30, backgroundColor: .black)

                // Login Form
                Form {                    
                    if (!viewModel.errorMessage.isEmpty) {
                        Text(viewModel.errorMessage)
                            .foregroundColor(Color.red)
                    }
                    
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocapitalization(.none)
                    
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    VButton(buttonText: "Login", backgroundColor: .blue) {
                        viewModel.login()
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
