//
//  ContentView.swift
//  ProfileCardSwipe
//
//  Created by Navdeep Singh on 20/08/25.
//

import SwiftUI

// MARK: - Main Content View
struct ContentView: View {
    @StateObject private var viewModel = ProfilesViewModel()
    
    var body: some View {
        TabView {
            NavigationView {
                SwipeDeckView(vm: viewModel)
                    .navigationBarHidden(true)
            }
            .tabItem {
                Image(systemName: "flame.fill")
                Text("Explore")
            }
            
            NavigationView {
                MessagingView()
                    .navigationTitle("Messages")
                    .navigationBarTitleDisplayMode(.large)
            }
            .tabItem {
                Image(systemName: "message.fill")
                Text("Messages")
            }
            
            NavigationView {
                NotificationsView()
                    .navigationTitle("Notifications")
                    .navigationBarTitleDisplayMode(.large)
            }
            .tabItem {
                Image(systemName: "bell.fill")
                Text("Notifications")
            }
            
            NavigationView {
                ProfileSettingsView()
                    .navigationTitle("Profile")
                    .navigationBarTitleDisplayMode(.large)
            }
            .tabItem {
                Image(systemName: "person.fill")
                Text("Profile")
            }
        }
        .accentColor(.red)
    }
}

#Preview {
    ContentView()
}
