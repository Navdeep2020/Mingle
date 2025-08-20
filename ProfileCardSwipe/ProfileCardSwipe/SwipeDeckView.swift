//
//  SwipeDeckView.swift
//  ProfileCardSwipe
//
//  Created by Navdeep Singh on 20/08/25.
//

import SwiftUI

// MARK: - Swipe Deck View
struct SwipeDeckView: View {
    @ObservedObject var vm: ProfilesViewModel
    @Namespace private var namespace

    @State private var translation: CGSize = .zero
    @State private var topCardIndex: Int = 0
    @State private var isShowingDetail: Bool = false
    @State private var selectedProfile: Profile?

    private let threshold: CGFloat = 120

    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [
                    Color(red: 0.8, green: 0.2, blue: 0.6),
                    Color(red: 0.0, green: 0.0, blue: 0.0)
                ]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            VStack {
                Spacer(minLength: 80)
                
                if vm.profiles.isEmpty {
                    VStack(spacing: 12) {
                        Text("No more profiles")
                            .font(.title2).bold()
                            .foregroundColor(.white)
                        Button("Reload sample") { vm.loadSampleData() }
                            .foregroundColor(.white)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 10)
                            .background(.ultraThinMaterial)
                            .clipShape(Capsule())
                    }
                } else {
                    ZStack {
                        ForEach(Array(vm.profiles.prefix(4).enumerated()), id: \.element.id) { (index, profile) in
                            card(for: profile, index: index)
                                .zIndex(Double(100 - index))
                        }
                    }
                    .padding(.horizontal, 20)
                }
                
                Spacer(minLength: 20)
                
                HStack(spacing: 20) {
                    Button(action: { vm.undoLast(); feedback(.success) }) {
                        CircleButton(systemName: "arrow.uturn.left", size: 50)
                    }
                    .disabled(!vm.canUndo)
                    
                    Button(action: { vm.swipeTop(shouldLike: false); feedback(.error) }) {
                        CircleButton(systemName: "xmark", size: 60)
                    }
                    
                    Button(action: { vm.swipeTop(shouldLike: true); feedback(.success) }) {
                        CircleButton(systemName: "heart.fill", size: 70)
                    }
                }
                .padding(.bottom, 20)
            }
        }
        .navigationDestination(isPresented: $isShowingDetail) {
            if let p = selectedProfile {
                ProfileDetailView(profile: p, namespace: namespace)
            }
        }
    }

    @ViewBuilder
    private func card(for profile: Profile, index: Int) -> some View {
        let isTop = index == 0
        ProfileCardView(profile: profile) {
            selectedProfile = profile
            isShowingDetail = true
        }
        .matchedGeometryEffect(id: profile.id, in: namespace)
        .scaleEffect(1 - Double(index) * 0.04)
        .offset(y: Double(index) * 10)
        .rotationEffect(.degrees(isTop ? Double(translation.width / 20) : 0))
        .offset(x: isTop ? translation.width : 0, y: isTop ? translation.height : 0)
        .gesture(isTop ? dragGesture(profile: profile) : nil)
        .onTapGesture {
            selectedProfile = profile
            isShowingDetail = true
        }
        .animation(.interactiveSpring(response: 0.45, dampingFraction: 0.8, blendDuration: 0.3), value: vm.profiles)
        .animation(.easeInOut, value: translation)
        .accessibilityElement(children: .combine)
        .accessibilityLabel("Profile card for \(profile.name), \(profile.age), located in \(profile.location).")
    }

    private func dragGesture(profile: Profile) -> some Gesture {
        DragGesture(minimumDistance: 6)
            .onChanged { value in
                translation = value.translation
            }
            .onEnded { value in
                let drag = value.translation.width
                let shouldLike = drag > threshold
                let shouldDislike = drag < -threshold

                if shouldLike {
                    withAnimation(.spring()) {
                        translation = CGSize(width: 800, height: value.translation.height)
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.12) {
                        vm.removeTop(didLike: true)
                        translation = .zero
                        feedback(.success)
                    }
                } else if shouldDislike {
                    withAnimation(.spring()) {
                        translation = CGSize(width: -800, height: value.translation.height)
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.12) {
                        vm.removeTop(didLike: false)
                        translation = .zero
                        feedback(.error)
                    }
                } else {
                    withAnimation(.spring()) {
                        translation = .zero
                    }
                }
            }
    }

    private func feedback(_ kind: UINotificationFeedbackGenerator.FeedbackType) {
        let g = UINotificationFeedbackGenerator()
        g.notificationOccurred(kind)
    }
}
