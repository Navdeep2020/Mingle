//
//  ProfilesViewModel.swift
//  ProfileCardSwipe
//
//  Created by Navdeep Singh on 20/08/25.
//

import SwiftUI
import Combine

// MARK: - Profiles View Model
final class ProfilesViewModel: ObservableObject {
    @Published private(set) var profiles: [Profile] = []
    @Published var isPerformingAction = false

    private var removedStack: [(profile: Profile, index: Int, didLike: Bool?)] = []

    init() {
        loadSampleData()
    }

    func loadSampleData() {
        profiles = [
            Profile(id: .init(), name: "Aanya", age: 25, gender: .female, location: "Mumbai", bio: "Coffee lover • UI designer • Cat person", imageURL: URL(string: "https://picsum.photos/seed/1/600/800"), isOnline: true),
            Profile(id: .init(), name: "Ravi", age: 29, gender: .male, location: "Bengaluru", bio: "iOS engineer • Loves trekking and chai", imageURL: URL(string: "https://picsum.photos/seed/2/600/800"), isOnline: false),
            Profile(id: .init(), name: "Simran", age: 27, gender: .female, location: "Delhi", bio: "Photographer • Weekend baker", imageURL: URL(string: "https://picsum.photos/seed/3/600/800"), isOnline: true),
            Profile(id: .init(), name: "Karan", age: 30, gender: .male, location: "Chandigarh", bio: "Guitarist • Startup enthusiast", imageURL: URL(string: "https://picsum.photos/seed/4/600/800"), isOnline: false),
            Profile(id: .init(), name: "Meera", age: 24, gender: .female, location: "Kolkata", bio: "Yogi • Product designer", imageURL: URL(string: "https://picsum.photos/seed/5/600/800"), isOnline: true)
        ]
    }

    func swipeTop(shouldLike: Bool) {
        guard !profiles.isEmpty, !isPerformingAction else { return }
        isPerformingAction = true
        let top = profiles.removeFirst()
        removedStack.append((top, 0, shouldLike))
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.35) {
            self.isPerformingAction = false
        }
    }

    func removeTop(didLike: Bool) {
        guard !profiles.isEmpty else { return }
        let top = profiles.removeFirst()
        removedStack.append((top, 0, didLike))
    }

    func undoLast() {
        guard let last = removedStack.popLast() else { return }
        profiles.insert(last.profile, at: 0)
    }

    func addProfile(_ p: Profile) {
        profiles.append(p)
    }

    var canUndo: Bool { !removedStack.isEmpty }
}
