//
//  ProfileCardView.swift
//  ProfileCardSwipe
//
//  Created by Navdeep Singh on 20/08/25.
//

import SwiftUI

// MARK: - Profile Card View
struct ProfileCardView: View {
    let profile: Profile
    let onTap: () -> Void

    var body: some View {
        GeometryReader { geo in
            VStack(spacing: 0) {
                AsyncImage(url: profile.imageURL) { phase in
                    switch phase {
                    case .empty:
                        ZStack { ProgressView() }
                            .frame(height: geo.size.height * 0.72)
                    case .success(let img):
                        img
                            .resizable()
                            .scaledToFill()
                            .frame(height: geo.size.height * 0.72)
                            .clipped()
                    case .failure(_):
                        ZStack {
                            Color.gray.opacity(0.2)
                            Image(systemName: "person.crop.rectangle.fill")
                                .font(.largeTitle)
                                .opacity(0.6)
                        }
                        .frame(height: geo.size.height * 0.72)
                    @unknown default:
                        EmptyView()
                    }
                }

                VStack(alignment: .leading, spacing: 6) {
                    HStack {
                        HStack(spacing: 4) {
                            Text("\(profile.name), \(profile.age)")
                                .font(.title2).bold()
                            Text(profile.gender.symbol)
                                .font(.title2)
                                .foregroundColor(profile.gender.color)
                            if profile.isOnline {
                                Circle()
                                    .fill(Color.green)
                                    .frame(width: 8, height: 8)
                            }
                        }
                        Spacer()
                        HStack(spacing: 4) {
                            Image(systemName: "location.fill")
                                .font(.caption)
                                .foregroundColor(profile.gender.color)
                            Text(profile.location)
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                        }
                    }
                    Text(profile.bio)
                        .font(.body)
                        .foregroundStyle(.secondary)
                        .lineLimit(3)
                }
                .padding()
                .background(.ultraThinMaterial)
                .background(profile.gender.color.opacity(0.1))
            }
            .background(
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .fill(profile.gender.color.opacity(0.2))
            )
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            .shadow(color: Color.black.opacity(0.12), radius: 20, x: 0, y: 8)
        }
    }
}
