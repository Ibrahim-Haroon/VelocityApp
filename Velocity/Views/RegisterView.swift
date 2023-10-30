//
//  RegisterView.swift
//  Velocity
//
//  Created by Ibrahim Haroon on 10/28/23.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewViewModel()
    
    var body: some View {
        VStack {
            HeaderView(title: "Create An Account", titleSize: 40, subtitle: "Greatness Awaits", subtitleSize: 30, backgroundColor: .black)
            
            Form {
                if (!viewModel.errorMessage.isEmpty) {
                    Text(viewModel.errorMessage)
                        .foregroundColor(Color.red)
                }
                
                TextField("Full Name", text: $viewModel.fullName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.none)
                
                TextField("Email Address", text: $viewModel.email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                VButton(buttonText: "Create Account", backgroundColor: .blue) {
                    viewModel.register()
                }
            }
            Spacer()
        }
    }
}

#Preview {
    RegisterView()
}
