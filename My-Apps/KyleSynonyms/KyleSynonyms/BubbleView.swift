import SwiftUI

// MARK: - Individual Bubble View
struct BubbleView<Content: View>: View {

    @EnvironmentObject var motion: MotionManager
    @EnvironmentObject var themeManager: ThemeManager

    let item: CircleWord
    let content: Content


    init(item: CircleWord, @ViewBuilder content: () -> Content) {
        self.item = item
        self.content = content()
    }

    var body: some View {
        ZStack {
            // MARK: - Layer 1: Bubble Background & Core Layers
            Circle()
                .fill(themeManager.currentTheme.bubbleBaseColor)

            Circle()
                .fill(
                    RadialGradient(
                        gradient: Gradient(colors: [
                            .blue.opacity(0.5),
                            .black.opacity(0.6)
                        ]),
                        center: .center,
                        startRadius: 1,
                        endRadius: item.radius
                    )
                )
                .opacity(0.8)

            Circle()
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: [.white.opacity(0.9), .white.opacity(0.0)]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .scaleEffect(0.9)
                .blur(radius: 2)
                .opacity(0.5)

            Circle()
               .fill(Color.white)
               .frame(width: item.diameter * 0.2, height: item.diameter * 0.2)
               .blur(radius: 3)
               .offset(
                   x: -item.radius * 0.5 + motion.x * 20,
                   y: -item.radius * 0.5 + motion.y * 20
               )
               .opacity(0.7)

            Circle()
                .stroke(
                    LinearGradient(
                        gradient: Gradient(colors: [.white.opacity(0.3), .clear]),
                        startPoint: .bottom,
                        endPoint: .top
                    ),
                    lineWidth: 3
                )
                .scaleEffect(0.95)
                .blur(radius: 2)

            // MARK: - Layer 2: Color Dot Indicator
            if item.isCore || item.level == "advanced" {
                Circle()
                    // isCore는 빨간색, advanced는 보라색 점으로 표시
                    .fill(item.isCore ? Color.red : Color.purple)
                    // 점의 크기를 매우 작게 설정
                    .frame(width: item.radius * 0.2, height: item.radius * 0.2)
                    .overlay(
                        Circle().stroke(Color.black.opacity(0.2), lineWidth: 1)
                    )
                    // offset을 이용해 점을 오른쪽 위로 이동
                    .offset(x: item.radius * 0.6, y: -item.radius * 0.6)
            }

            // MARK: - Layer 3: Content
            content
                .font(.system(size: item.radius * 0.45, weight: .bold, design: .rounded))
                .foregroundColor(themeManager.currentTheme.textColor)
                .shadow(color: .black.opacity(0.6), radius: 5, x: 2, y: 3)
                .lineLimit(2)
                .minimumScaleFactor(0.5)
                .multilineTextAlignment(.center)
                .padding(item.radius * 0.15)
        }
        .frame(width: item.diameter, height: item.diameter)
        .compositingGroup()
        .shadow(color: .black.opacity(0.35), radius: 10, x: 0, y: 8)
    }
}
