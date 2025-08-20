//
//  Components.swift
//  ProfileCardSwipe
//
//  Created by Navdeep Singh on 20/08/25.
//

import SwiftUI

// MARK: - Circle Button Component
struct CircleButton: View {
    let systemName: String
    let size: CGFloat

    var body: some View {
        ZStack {
            Circle()
                .fill(.ultraThinMaterial)
                .frame(width: size, height: size)
                .shadow(color: .black.opacity(0.2), radius: 8, x: 0, y: 4)
            Image(systemName: systemName)
                .font(.system(size: size * 0.4, weight: .semibold))
                .foregroundStyle(.white)
        }
    }
}

// MARK: - Messaging View
struct MessagingView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "message.circle.fill")
                .font(.system(size: 80))
                .foregroundColor(.gray)
            
            Text("No Messages Yet")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
            
            Text("When you match with someone, your conversations will appear here")
                .font(.body)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 40)
            
            Button(action: {}) {
                Text("Start Exploring")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.horizontal, 30)
                    .padding(.vertical, 12)
                    .background(Color.red)
                    .clipShape(Capsule())
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.systemGroupedBackground))
    }
}

// MARK: - Notifications View
struct NotificationsView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "bell.circle.fill")
                .font(.system(size: 80))
                .foregroundColor(.gray)
            
            Text("No Notifications")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
            
            Text("You'll be notified about new matches, messages, and updates")
                .font(.body)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 40)
            
            Button(action: {}) {
                Text("Enable Notifications")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.horizontal, 30)
                    .padding(.vertical, 12)
                    .background(Color.red)
                    .clipShape(Capsule())
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.systemGroupedBackground))
    }
}

// MARK: - Profile Settings View
struct ProfileSettingsView: View {
    @State private var isNotificationsEnabled = true
    @State private var isLocationEnabled = true
    
    var body: some View {
        List {
            Section("Profile") {
                HStack {
                    AsyncImage(url: URL(string: "https://picsum.photos/seed/profile/100/100")) { phase in
                        if let image = phase.image {
                            image.resizable().scaledToFill()
                        } else {
                            Color.gray
                        }
                    }
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Your Profile")
                            .font(.headline)
                        Text("Tap to edit your profile")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                        .foregroundColor(.secondary)
                }
                .padding(.vertical, 4)
            }
            
            Section("Preferences") {
                Toggle("Notifications", isOn: $isNotificationsEnabled)
                Toggle("Location Services", isOn: $isLocationEnabled)
                
                NavigationLink(destination: Text("Privacy Settings")) {
                    Label("Privacy", systemImage: "lock.fill")
                }
                
                NavigationLink(destination: Text("Account Settings")) {
                    Label("Account", systemImage: "person.circle.fill")
                }
            }
            
            Section("Support") {
                NavigationLink(destination: Text("Help Center")) {
                    Label("Help & Support", systemImage: "questionmark.circle.fill")
                }
                
                NavigationLink(destination: Text("About")) {
                    Label("About App", systemImage: "info.circle.fill")
                }
            }
            
            Section {
                Button(action: {}) {
                    HStack {
                        Spacer()
                        Text("Sign Out")
                            .foregroundColor(.red)
                        Spacer()
                    }
                }
            }
        }
        .listStyle(InsetGroupedListStyle())
    }
}
