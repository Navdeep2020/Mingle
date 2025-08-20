//
//  ProfileCardSwipeApp.swift
//  ProfileCardSwipe
//
//  Created by Navdeep Singh on 20/08/25.
//

import SwiftUI

@main
struct ProfileCardSwipeApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                            SwipeDeckView(vm: ProfilesViewModel())
                                .navigationTitle("Discover")
                        }
        }
    }
}
