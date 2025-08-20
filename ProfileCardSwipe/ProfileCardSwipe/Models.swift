//
//  Models.swift
//  ProfileCardSwipe
//
//  Created by Navdeep Singh on 20/08/25.
//

import SwiftUI

// MARK: - Gender Enum
enum Gender: String, CaseIterable {
    case male = "male"
    case female = "female"
    
    var symbol: String {
        switch self {
        case .male: return "♂"
        case .female: return "♀"
        }
    }
    
    var color: Color {
        switch self {
        case .male:
            return Color(red: 0.0, green: 0.48, blue: 1.0)
        case .female:
            return Color(red: 1.0, green: 0.0, blue: 0.5)
        }
    }
}

// MARK: - Profile Model
struct Profile: Identifiable, Equatable {
    let id: UUID
    let name: String
    let age: Int
    let gender: Gender
    let location: String
    let bio: String
    let imageURL: URL?
    let isOnline: Bool
}
