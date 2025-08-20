# ProfileCardSwipe 📱

A modern iOS dating app clone built with SwiftUI, featuring profile card swiping functionality similar to Tinder.

## 🎯 Features

### Core Functionality
- **Profile Card Swiping**: Swipe left/right to like/dislike profiles
- **Gesture Recognition**: Smooth drag gestures with haptic feedback
- **Card Stack**: Multiple cards with depth and scaling effects
- **Undo Functionality**: Undo last swipe action
- **Online Status**: Real-time online indicators for profiles

### UI/UX Features
- **Beautiful Gradient Background**: Purple to magenta gradient
- **Gender-based Theming**: Blue for males, pink for females
- **Full-Screen Detail View**: Immersive profile details with overlay
- **Tab Navigation**: Explore, Messages, Notifications, Profile tabs
- **Glassmorphism Design**: Modern translucent UI elements

## 🏗️ Architecture

### File Structure
```
ProfileCardSwipe/
├── Models.swift              # Data models (Profile, Gender)
├── ProfilesViewModel.swift   # Business logic and state management
├── ProfileCardView.swift     # Individual profile card component
├── SwipeDeckView.swift       # Main swipe interface
├── ProfileDetailView.swift   # Full-screen profile details
├── Components.swift          # Reusable UI components
└── ContentView.swift         # Main app structure with TabView
```

### Design Patterns
- **MVVM Architecture**: Clean separation of concerns
- **ObservableObject**: Reactive state management
- **View Composition**: Modular, reusable components
- **Gesture Handling**: Custom drag gestures with feedback

## 🚀 Getting Started

### Prerequisites
- Xcode 15.0+
- iOS 17.0+
- Swift 5.9+

### Installation
1. Clone the repository
2. Open `ProfileCardSwipe.xcodeproj` in Xcode
3. Build and run on iOS Simulator or device

### Usage
1. **Swipe Right**: Like a profile (heart animation)
2. **Swipe Left**: Dislike a profile (X animation)
3. **Tap Card**: View detailed profile information
4. **Use Buttons**: Undo, dislike, or like with buttons
5. **Navigate Tabs**: Switch between different app sections

## 📱 Screenshots

<img width="346" height="720" alt="image" src="https://github.com/user-attachments/assets/e66cff95-a2fb-49c3-9d32-8e980fa37367" />
<img width="346" height="720" alt="image" src="https://github.com/user-attachments/assets/dfcddefa-24ea-46d1-a515-68c3bfa71848" />
<img width="336" height="720" alt="image" src="https://github.com/user-attachments/assets/2f283e38-acc4-48b6-93e4-f452fa09e84b" />

### Main Features
- Profile card swiping with smooth animations
- Full-screen detail view with rich information
- Tab-based navigation system
- Gender-based color theming
- Online status indicators

## 🔧 Customization

### Adding New Profiles
```swift
// In ProfilesViewModel.swift
func loadSampleData() {
    profiles = [
        Profile(
            id: .init(),
            name: "Your Name",
            age: 25,
            gender: .female,
            location: "Your City",
            bio: "Your bio description",
            imageURL: URL(string: "your-image-url"),
            isOnline: true
        )
        // Add more profiles...
    ]
}
```

### Modifying Colors
```swift
// In Models.swift
var color: Color {
    switch self {
    case .male: return Color.blue      // Customize male color
    case .female: return Color.pink    // Customize female color
    }
}
```

## 🛠️ Technical Details

### Dependencies
- **SwiftUI**: Modern declarative UI framework
- **Combine**: Reactive programming for state management
- **UIKit**: Haptic feedback integration

### Performance Optimizations
- **Lazy Loading**: Images loaded asynchronously
- **Card Recycling**: Efficient memory management
- **Gesture Optimization**: Smooth 60fps animations

### Accessibility
- **VoiceOver Support**: Descriptive labels for all elements
- **Dynamic Type**: Scalable text sizes
- **High Contrast**: Readable in all lighting conditions

## 📄 License

This project is created for educational purposes. Feel free to use and modify as needed.

## 👨‍💻 Author

**Navdeep Singh**
- Created: August 20, 2025
- Platform: iOS
- Framework: SwiftUI

---

*Built with ❤️ using SwiftUI*
