import SwiftUI
import Combine

class ThemeManager: ObservableObject {
    @Published var isLightBlueTheme: Bool = false

    var bubbleBaseColor: Color {
        isLightBlueTheme ? Color(red: 0.5, green: 0.7, blue: 0.95) : Color(red: 0.2, green: 0.4, blue: 0.9)
    }

    var backgroundColor: Color {
        isLightBlueTheme ? Color(red: 0.95, green: 0.98, blue: 1.0) : Color.white
    }
    
    var secondaryBackgroundColor: Color {
        isLightBlueTheme ? Color(red: 0.9, green: 0.95, blue: 1.0) : Color(red: 0.95, green: 0.95, blue: 0.97)
    }
    
    var textColor: Color {
        isLightBlueTheme ? Color.black : Color.white
    }
    
    var secondaryTextColor: Color {
        isLightBlueTheme ? Color.gray : Color.white.opacity(0.8)
    }
}