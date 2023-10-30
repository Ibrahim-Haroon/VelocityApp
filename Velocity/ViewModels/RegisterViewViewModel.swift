//
//  RegisterViewViewModel.swift
//  Velocity
//
//  Created by Ibrahim Haroon on 10/28/23.
//

import FirebaseFirestore
import FirebaseAuth
import Foundation

class RegisterViewViewModel: ObservableObject {
    @Published var fullName: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var errorMessage: String = ""
    
    init() {}
    
    func register() {
        guard validate() else {
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let userId = result?.user.uid else {
                return
            }
            
            self?.insertUserRecord(id: userId)
        }
    }
    
    private func insertUserRecord(id: String) {
        let newUser = User(id: id, name: fullName, email: email, joined: Date().timeIntervalSince1970)
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
    }
    
    private func validate() -> Bool {
        errorMessage = ""
        guard !fullName.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty,
              !email.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty,
              !password.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            
            if (email.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty) {
                errorMessage = "Full Name is Empty"
            }
            if (email.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty) {
                if (errorMessage.isEmpty) {
                    errorMessage = "Email empty"
                }
                else { errorMessage.append(" and Email empty") }
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
        
        guard password.count >= 6 else {
            errorMessage = "Passsword length too short, must be at least 6 characters, currently: \(password.count)"
            return false
        }
        
        return true
    }
}
