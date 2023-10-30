//
//  LoginViewViewModel.swift
//  Velocity
//
//  Created by Ibrahim Haroon on 10/28/23.
//

import FirebaseAuth
import Foundation

class LoginViewViewModel: ObservableObject {
    @Published var email: String = "";
    @Published var password: String = "";
    @Published var errorMessage: String = "";
    
    init() {}
    
    func login() {
        guard validate() else {
            return
        }
        // firebase
        Auth.auth().signIn(withEmail: email, password: password)
    }
    
    private func validate() -> Bool {
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty,
              !password.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            
            if (email.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty) {
                errorMessage = "Email empty"
            }
            if (password.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty) {
                if (errorMessage.isEmpty) {
                    errorMessage = "Password empty"
                }
                else { errorMessage.append(" and Password empty") }
            }
            
            return false
        }
        
        guard email.contains("@") && email.contains(".") && email.contains("com") else {
            errorMessage = "Invalid email address"
            
            return false
        }
        
        return true
    }
}
