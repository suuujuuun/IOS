import SwiftUI

// MARK: - Individual Bubble View
struct BubbleView<Content: View>: View {
    let item: CircleWord
    let content: Content

    init(item: CircleWord, @ViewBuilder content: () -> Content) {
        self.item = item
        self.content = content()
    }

    var body: some View {
        ZStack {
            // MARK: - Bubble Background & Core Layers
            
            // Layer 1: The deep blue base color of the bubble
            Circle()
                .fill(Color(red: 0.2, green: 0.4, blue: 0.9))

            // Layer 2: A radial gradient to create a sense of spherical volume
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

            // Layer 3: A sharp, top-down highlight to simulate overhead light
            Circle()
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: [.white.opacity(0.9), .white.opacity(0.0)]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .scaleEffect(0.9) // Slightly inset
                .blur(radius: 2)
                .opacity(0.5)

            // Layer 4: A crisp, "specular" highlight for a glassy look
            Circle()
                .fill(Color.white)
                .frame(width: item.diameter * 0.2, height: item.diameter * 0.2)
                .blur(radius: 3)
                .offset(x: -item.radius * 0.4, y: -item.radius * 0.5)
                .opacity(0.7)

            // Layer 5: A subtle bottom reflection (rim light)
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


            // MARK: - Content
            content
                .font(.system(size: item.radius * 0.45, weight: .bold, design: .rounded))
                .foregroundColor(.white)
                .shadow(color: .black.opacity(0.6), radius: 5, x: 2, y: 3) // More pronounced shadow for text
                .lineLimit(2)
                .minimumScaleFactor(0.5)
                .multilineTextAlignment(.center)
                .padding(item.radius * 0.15)
        }
        .frame(width: item.diameter, height: item.diameter)
        .compositingGroup() // Group layers for better performance
        // Add a soft drop shadow to lift the bubble off the background
        .shadow(color: .black.opacity(0.35), radius: 10, x: 0, y: 8)
    }
}
