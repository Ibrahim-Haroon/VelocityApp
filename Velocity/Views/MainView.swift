//
//  ContentView.swift
//  Velocity
//
//  Created by Ibrahim Haroon on 10/28/23.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    
    var body: some View {
        if (viewModel.isSignedIn && !viewModel.currentUserId.isEmpty) {
            ToDoListView()
        } else { LoginView() }
//        LoginView()
        
    }
}

#Preview {
    MainView()
}
