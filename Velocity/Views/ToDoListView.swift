//
//  ToDoListView.swift
//  Velocity
//
//  Created by Ibrahim Haroon on 10/28/23.
//

import FirebaseAuth
import FirebaseFirestoreSwift
import SwiftUI

struct ToDoListView: View {
    @StateObject var viewModel: ToDoListViewViewModel
    @State var notSignedIn: Bool
    @FirestoreQuery var items: [ToDoListItem]
    
    init(userId: String) {
        if let userId = Auth.auth().currentUser?.uid {
            self._items = FirestoreQuery(collectionPath: "users/\(userId)/TODOs")
            self._viewModel = StateObject(
                wrappedValue: ToDoListViewViewModel(userId: userId)
            )
        }
        else {
            notSignedIn = true
        }
    }
    
    var body: some View {
        NavigationView {
            if notSignedIn {
                Button("OK") {
                    NavigationLink("Back to login", destination: LoginView())
                }
                .alert(isPresented: $notSignedIn) {
                    Alert(title: Text("No user signed in"), message: Text("Please log in."), dismissButton: .default(Text("OK")))
                }
                VStack {
                    List(items) {item in
                        ToDoListItemView(item: item)
                            .swipeActions {
                                Button("delete") {
                                    viewModel.delete(id: item.id)
                                }
                                .tint(.red)
                                
                            }
                    }
                    .listStyle(PlainListStyle())
                }
                .navigationTitle("To Do List")
                .toolbar {
                    Button {
                        viewModel.showingNewItemView = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
                .sheet(isPresented: $viewModel.showingNewItemView) {
                    NewItemView
                }
            }
        }
    }
    
    #Preview {
        ToDoListView(userId: "C2q1OTD6ucfZGeuuKoiJzkjBozi2")
    }
}
