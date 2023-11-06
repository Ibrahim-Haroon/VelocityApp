//
//  ToDoListItemViewViewModel.swift
//  Velocity
//
//  Created by Ibrahim Haroon on 10/28/23.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class ToDoListItemViewViewModel: ObservableObject {
    init() {}
    
    func toggleDone(item: ToDoListItem) {
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("TODOs")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
    }
}
