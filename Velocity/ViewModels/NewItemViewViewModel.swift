//
//  ViewItemViewModel.swift
//  Velocity
//
//  Created by Ibrahim Haroon on 10/28/23.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class NewItemViewViewModel: ObservableObject {
    static let secondsInADay: TimeInterval = 24 * 60 * 60
    @Published var title: String = ""
    @Published var dueDate: Date =  Date()
    @Published var difficulty: Double = 0
    @Published var showAlert: Bool = false
    
    init() {}
    
    func save() {
        guard canSave else {
            return
        }
        // Get current user id
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        
        // Create model
        let newId = UUID().uuidString
        let newItem = ToDoListItem(id: newId, title: title, difficulty: difficulty, dueDate: dueDate.timeIntervalSince1970, createDate: Date().timeIntervalSince1970, isDone: false)
        
        // Save model
        let db = Firestore.firestore()
        db.collection("users")
            .document(uId)
            .collection("TODOs")
            .document(newId)
            .setData(newItem.asDictionary())
        return
    }
    
    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            return false;
        }
        
        guard dueDate >= Date().addingTimeInterval(-NewItemViewViewModel.secondsInADay) else {
            return false
        }
        
        return true
    }
}
