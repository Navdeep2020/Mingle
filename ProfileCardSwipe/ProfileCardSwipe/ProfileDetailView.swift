//
//  ProfileDetailView.swift
//  ProfileCardSwipe
//
//  Created by Navdeep Singh on 20/08/25.
//

import SwiftUI

// MARK: - Profile Detail View
struct ProfileDetailView: View {
    let profile: Profile
    var namespace: Namespace.ID
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        GeometryReader { geo in
            ZStack {
                AsyncImage(url: profile.imageURL) { phase in
                    switch phase {
                    case .success(let img):
                        img
                            .resizable()
                            .scaledToFill()
                            .frame(width: geo.size.width, height: geo.size.height)
                            .clipped()
                            .ignoresSafeArea()
                    case .empty:
                        Color.gray
                            .frame(width: geo.size.width, height: geo.size.height)
                            .ignoresSafeArea()
                    default:
                        Color.gray
                            .frame(width: geo.size.width, height: geo.size.height)
                            .ignoresSafeArea()
                    }
                }
                .matchedGeometryEffect(id: profile.id, in: namespace)
                
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color.clear,
                        Color.black.opacity(0.3),
                        Color.black.opacity(0.7)
                    ]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                
                VStack {
                    HStack {
                        Button(action: { dismiss() }) {
                            Image(systemName: "xmark")
                                .font(.title2)
                                .foregroundColor(.white)
                                .padding(12)
                                .background(.ultraThinMaterial)
                                .clipShape(Circle())
                        }
                        
                        Spacer()
                        
                        Button(action: {}) {
                            Image(systemName: "ellipsis")
                                .font(.title2)
                                .foregroundColor(.white)
                                .padding(12)
                                .background(.ultraThinMaterial)
                                .clipShape(Circle())
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 60)
                    
                    Spacer()
                    
                    VStack(alignment: .leading, spacing: 12) {
                        HStack(spacing: 6) {
                            Text("\(profile.name) \(profile.age)")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            Text(profile.gender.symbol)
                                .font(.largeTitle)
                                .foregroundColor(profile.gender.color)
                        }
                        
                        HStack(spacing: 4) {
                            Image(systemName: "location.fill")
                                .font(.subheadline)
                                .foregroundColor(profile.gender.color)
                            Text(profile.location)
                                .font(.headline)
                                .foregroundColor(.white.opacity(0.9))
                        }
                        
                        Text(profile.bio)
                            .font(.body)
                            .foregroundColor(.white.opacity(0.9))
                            .lineLimit(3)
                        
                        VStack(alignment: .leading, spacing: 8) {
                            HStack(spacing: 8) {
                                ForEach(getInterests(for: profile.name), id: \.self) { interest in
                                    Text(interest)
                                        .font(.caption)
                                        .padding(.horizontal, 12)
                                        .padding(.vertical, 6)
                                        .background(.ultraThinMaterial)
                                        .foregroundColor(.white)
                                        .clipShape(Capsule())
                                }
                            }
                            
                            VStack(alignment: .leading, spacing: 6) {
                                detailRow(icon: "briefcase.fill", text: getJob(for: profile.name))
                                detailRow(icon: "graduationcap.fill", text: getEducation(for: profile.name))
                                detailRow(icon: "heart.fill", text: getInterests(for: profile.name).joined(separator: ", "))
                                detailRow(icon: "location.fill", text: "\(profile.location) • \(getDistance(for: profile.name))km away")
                            }
                        }
                        
                        HStack(spacing: 16) {
                            Button(action: {}) {
                                CircleButton(systemName: "arrow.uturn.left", size: 50)
                            }
                            
                            Button(action: {}) {
                                CircleButton(systemName: "xmark", size: 60)
                            }
                            
                            Button(action: {}) {
                                CircleButton(systemName: "heart.fill", size: 70)
                            }
                            
                            Button(action: {}) {
                                CircleButton(systemName: "star.fill", size: 50)
                            }
                            
                            Button(action: {}) {
                                CircleButton(systemName: "paperplane.fill", size: 50)
                            }
                        }
                        .padding(.top, 8)
                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom, 40)
                }
            }
        }
        .ignoresSafeArea()
        .navigationBarHidden(true)
    }
    
    private func detailRow(icon: String, text: String) -> some View {
        HStack(spacing: 8) {
            Image(systemName: icon)
                .font(.caption)
                .foregroundColor(profile.gender.color)
                .frame(width: 16)
            Text(text)
                .font(.caption)
                .foregroundColor(.white.opacity(0.9))
        }
    }
    
    private func getInterests(for name: String) -> [String] {
        switch name {
        case "Aanya": return ["Coffee", "Design", "Cats"]
        case "Ravi": return ["Trekking", "Chai", "iOS"]
        case "Simran": return ["Photography", "Baking", "Art"]
        case "Karan": return ["Guitar", "Startups", "Music"]
        case "Meera": return ["Yoga", "Design", "Wellness"]
        default: return ["Travel", "Music", "Food"]
        }
    }
    
    private func getJob(for name: String) -> String {
        switch name {
        case "Aanya": return "UI/UX Designer at TechCorp"
        case "Ravi": return "iOS Engineer at Apple"
        case "Simran": return "Freelance Photographer"
        case "Karan": return "Guitarist & Startup Founder"
        case "Meera": return "Product Designer at WellnessCo"
        default: return "Professional"
        }
    }
    
    private func getEducation(for name: String) -> String {
        switch name {
        case "Aanya": return "Design Institute of Technology"
        case "Ravi": return "IIT Bombay - Computer Science"
        case "Simran": return "National Institute of Photography"
        case "Karan": return "Music Academy & Business School"
        case "Meera": return "Yoga Institute & Design College"
        default: return "University Graduate"
        }
    }
    
    private func getDistance(for name: String) -> String {
        switch name {
        case "Aanya": return "2.5"
        case "Ravi": return "1.8"
        case "Simran": return "3.2"
        case "Karan": return "4.1"
        case "Meera": return "0.8"
        default: return "2.0"
        }
    }
}
