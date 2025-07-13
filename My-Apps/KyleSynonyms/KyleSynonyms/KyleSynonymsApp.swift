import SwiftUI

@main
struct KyleSynonymsApp: App {
    @StateObject private var themeManager = ThemeManager()
    @StateObject private var motionManager = MotionManager()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(themeManager)
                .environmentObject(motionManager)
        }
    }
}
