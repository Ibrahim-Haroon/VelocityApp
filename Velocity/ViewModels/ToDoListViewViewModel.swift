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
    // @Published var user: User? = nil
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
    
//    func incrementNumTasksCompleted() {
//        let db = Firestore.firestore()
//        let userDocument = db.collection("users").document(userId)
//        
//        userDocument.getDocument { snapshot, error in
//            guard let data = snapshot?.data(), error == nil else {
//                return
//            }
//            
//            var numTasksCompleted = data["numTasksCompleted"] as? Int ?? 0
//            numTasksCompleted += 1
//            
//            userDocument.updateData(["numTasksCompleted": numTasksCompleted])
//            
//        }
//    }
}
    

