//
//  NewItemView.swift
//  Velocity
//
//  Created by Ibrahim Haroon on 10/28/23.
//

import FirebaseFirestoreSwift
import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel: NewItemViewViewModel
    @Binding var newItemPresented: Bool
    
    
    init(newItemPresented: Bool) {
        self._newItemPresented
    }
    
    init(userId: String) {
        self._viewModel = StateObject(
        wrappedValue: NewItemViewViewModel())
    }
    
    var body: some View {
        VStack {
            Text("New Item")
                .font(.system(size: 32))
                .bold()
                .padding(.top, 15)
            Form {
                // Name
                TextField("Title", text: $viewModel.title)
                
                // Due Date
                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                // Difficulty (Override ML model)
                Text("Difficulty (optional) : \(String(format: "%.1f", viewModel.difficulty))")
                    .padding(.top, 10)
                Slider(value: $viewModel.difficulty, in: 0.0...10.0, step: 0.1)
                    .padding()
                
                // Button
                VButton(buttonText: "Create", backgroundColor: .red) {
                    if (viewModel.canSave) {
                        viewModel.save()
                        newItemPresented = false
                    } else {
                        viewModel.showAlert = true
                    }
                }
                .padding(.bottom, 10)
            }
            .alert(isPresented: $viewModel.showAlert) {
                Alert(title: Text("Error"), message: Text("Please fill in all fields and Due Date must be today or newer"))
            }
        }
    }
}

#Preview {
    NewItemView(newItemPresented: Binding(get: {
        return true
    }, set: { _ in }))
}
