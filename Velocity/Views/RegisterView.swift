//
//  RegisterView.swift
//  Velocity
//
//  Created by Ibrahim Haroon on 10/28/23.
//

import SwiftUI

struct RegisterView: View {
    @State var name: String = ""
    @State var email: String = ""
    @State var password: String = ""
    
    var body: some View {
        HeaderView(title: "Create An Account", titleSize: 40, subtitle: "", subtitleSize: 0, backgroundColor: .black)
        
        Form {
            TextField("Full Name", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle());
            TextField("Email Address", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle());
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle());
        }
        Spacer()
    }
}

#Preview {
    RegisterView()
}
