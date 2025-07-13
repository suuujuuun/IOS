import SwiftUI
import Combine

// 1. 테마 종류를 정의하는 Enum 생성
enum ColorTheme: CaseIterable {
    case defaultBlue
    case lightBlue
    case dark

    var bubbleBaseColor: Color {
        switch self {
        case .defaultBlue: return Color(red: 0.2, green: 0.4, blue: 0.9)
        case .lightBlue: return Color(red: 0.5, green: 0.7, blue: 0.95)
        case .dark: return Color(red: 0.1, green: 0.1, blue: 0.15)
        }
    }

    var backgroundColor: Color {
        switch self {
        case .defaultBlue: return Color.white
        case .lightBlue: return Color(red: 0.95, green: 0.98, blue: 1.0)
        case .dark: return Color(red: 0.05, green: 0.05, blue: 0.1)
        }
    }
    
    var secondaryBackgroundColor: Color {
        switch self {
        case .defaultBlue: return Color(red: 0.95, green: 0.95, blue: 0.97)
        case .lightBlue: return Color(red: 0.9, green: 0.95, blue: 1.0)
        case .dark: return Color(red: 0.15, green: 0.15, blue: 0.2)
        }
    }
    
    var textColor: Color {
        switch self {
        case .defaultBlue: return .white
        case .lightBlue: return .white
        case .dark: return .white
        }
    }
    
    var secondaryTextColor: Color {
        switch self {
        case .defaultBlue: return .white.opacity(0.8)
        case .lightBlue: return .gray
        case .dark: return .white.opacity(0.7)
        }
    }
}


class ThemeManager: ObservableObject {
    // 2. 현재 선택된 테마를 관리
    @Published var currentTheme: ColorTheme = .defaultBlue

    // 3. 테마를 다음 순서로 변경하는 함수
    func cycleTheme() {
        let allCases = ColorTheme.allCases
        guard let currentIndex = allCases.firstIndex(of: currentTheme) else { return }
        let nextIndex = (currentIndex + 1) % allCases.count
        currentTheme = allCases[nextIndex]
    }
}
