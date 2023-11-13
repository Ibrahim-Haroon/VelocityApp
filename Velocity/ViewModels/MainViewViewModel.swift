//
//  MainViewViewModel.swift
//  Velocity
//
//  Created by Ibrahim Haroon on 10/28/23.
//

import FirebaseAuth
import Foundation
import PythonKit

class MainViewViewModel: ObservableObject {
    @Published var currentUserId: String = ""
    private var handler: AuthStateDidChangeListenerHandle?
    
    init () {
        self.handler = Auth.auth().addStateDidChangeListener { [weak self] _, user in
            // DispatchQueue makes it where it's done on the main thread
            DispatchQueue.main.async {
                self?.currentUserId = user?.uid ?? ""
            }
        }
    }
    
//    let sys = Python.import("sys")
//    sys.path.append("/Users/ibrahimharoon/Documents/Personal_Projects/Swift/Velocity/Velocity/Other")
//    
//    let example = Python.import("ml_model")
//    example.print_hello_world()
//    
    public var isSignedIn: Bool {
        return Auth.auth().currentUser != nil
    }
}
