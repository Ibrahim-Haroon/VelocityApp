//
//  ToDoListViewViewModel.swift
//  Velocity
//
//  Created by Ibrahim Haroon on 10/28/23.
//

import FirebaseFirestore
import FirebaseAuth
import Foundation

class ToDoListViewViewModel: ObservableObject {
    @Published var showingNewItemView: Bool = false
    var userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    
    /// Delete task on TODO list
    /// - Parameter id: item ID to delete
    func delete(id: String) {
        let db = Firestore.firestore()
        db.collection("users")
            .document(userId)
            .collection("TODOs")
            .document(id)
            .delete()
    }
}

