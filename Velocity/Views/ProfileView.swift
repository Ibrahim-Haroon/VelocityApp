//
//  ProfileView.swift
//  Velocity
//
//  Created by Ibrahim Haroon on 10/28/23.
//

import FirebaseAuth
import FirebaseFirestore
import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if let user = viewModel.user {
                    profile(user: user)
                } else {
                    Text("Loading profile...")
                }
                
            }
            .navigationTitle("Profile")
        }
        .onAppear {
            viewModel.fetchUser()
        }
    }
    
    @ViewBuilder
    func profile(user: User) -> some View {
        // Avatar
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(Color.red)
            .frame(width: 125, height: 125)
        // Info: Name, Email, Memeber Since, Tasks Completed
        VStack(alignment: .leading) {
            HStack {
                Text("Name: ")
                Text(user.name)
            }
            
            HStack {
                Text("Email: ")
                Text(user.email)
            }
            
            HStack {
                Text("Member Since: ")
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
            }
            
            // HStack {
            //    Text("Tasks completed to date: ")
            //    Text("\(user.numTasksCompleted)")
            // }
        }
        
        // Sign out
        Button("Log Out") {
            viewModel.logOut()
        }
        Spacer()
    }
}

#Preview {
    ProfileView()
}
