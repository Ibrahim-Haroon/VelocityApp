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
            TabView {
                ToDoListView()
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                
                ProfileView()
                    .tabItem {
                        Label("Profile", systemImage: "person.circle")
                    }
            }
        } else { LoginView() }
//        LoginView()
        
    }
}

#Preview {
    MainView()
}
