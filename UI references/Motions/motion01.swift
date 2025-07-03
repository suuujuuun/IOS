import SwiftUI

// MARK: - Data Model
struct CircleWord: Identifiable {
    let id = UUID()
    let word: String
    let importance: Int
    /// Radius for each importance tier
    var radius: CGFloat {
        switch importance {
        case 3: return 80
        case 2: return 60
        default: return 40
        }
    }
    var diameter: CGFloat { radius * 2 }
}

// MARK: - Individual Bubble View
struct BubbleView: View {
    let item: CircleWord

    var body: some View {
        ZStack {
            // Liquid‑glass style circle
            Circle()
                .fill(.ultraThinMaterial)
                .background(
                    Circle()
                        .fill(
                            RadialGradient(
                                gradient: Gradient(colors: [Color.blue.opacity(0.25), Color.blue.opacity(0.7)]),
                                center: .center,
                                startRadius: 0,
                                endRadius: item.radius
                            )
                        )
                        .blur(radius: 6)
                )
                .overlay(
               
                    Circle().stroke(Color.white.opacity(0.6), lineWidth: 1)
                )
                .frame(width: item.diameter, height: item.diameter)


            Text(item.word)
                .font(font(for: item.importance))
                .foregroundColor(.white)
                .shadow(color: .black.opacity(0.25), radius: 2, x: 1, y: 1)
                .minimumScaleFactor(0.5)
        }
    }

    
    private func font(for level: Int) -> Font {
        switch level {
        case 3: return .system(size: 28, weight: .bold, design: .rounded)
        case 2: return .system(size: 20, weight: .semibold, design: .rounded)
        default: return .system(size: 16, weight: .regular, design: .rounded)
        }
    }
}

// MARK: - Main View
struct ContentView: View {
    // Importance: 3 = Most important, 2 = Moderate, 1 = Least important
    private let wordPool: [CircleWord] = [
        .init(word: "give",       importance: 3),
        .init(word: "provide",    importance: 3),
        .init(word: "offer",      importance: 2),
        .init(word: "grant",      importance: 2),
        .init(word: "supply",     importance: 2),
        .init(word: "donate",     importance: 1),
        .init(word: "contribute", importance: 1),
        .init(word: "deliver",    importance: 2),
        .init(word: "allocate",   importance: 1),
        .init(word: "distribute", importance: 2),
        .init(word: "present",    importance: 1),
        .init(word: "furnish",    importance: 1),
        .init(word: "hand",       importance: 1),
        .init(word: "impart",     importance: 1),
        .init(word: "equip",      importance: 1),
        .init(word: "bestow",     importance: 1),
        .init(word: "yield",      importance: 1),
        .init(word: "extend",     importance: 1),
        .init(word: "assign",     importance: 1),
        .init(word: "render",     importance: 1)
    ]

    @State private var bubbles: [Bubble] = []          // Positioned bubbles
    @State private var appeared: Set<UUID> = []        // Animation flags

    struct Bubble: Identifiable {
        let id: UUID
        let item: CircleWord
        var position: CGPoint
    }

    var body: some View {
        GeometryReader { geo in
            ZStack {
                Color.white.ignoresSafeArea()

                ForEach(bubbles) { bubble in
                    BubbleView(item: bubble.item)
                        .position(bubble.position)
                        .scaleEffect(appeared.contains(bubble.id) ? 1 : 0.3)
                        .opacity(appeared.contains(bubble.id) ? 1 : 0)
                        .animation(
                            .spring(response: 0.6, dampingFraction: 0.75)
                                .delay(Double(index(of: bubble)) * 0.04),
                            value: appeared
                        )
                        .onAppear {
                            appeared.insert(bubble.id)
                        }
                }
            }
            .onAppear {
                layoutBubbles(in: geo.size)
            }
        }
    }

    // MARK: - Layout Helper
    private func layoutBubbles(in size: CGSize) {
        var placed: [Bubble] = []
        let safeRect = CGRect(origin: .zero, size: size)
        let maxAttempts = 2000

        for word in wordPool {
            var attempt = 0
            var hit = false

            while attempt < maxAttempts && !hit {
                attempt += 1
                let radius = word.radius
                let x = CGFloat.random(in: radius...(size.width - radius))
                let y = CGFloat.random(in: radius...(size.height - radius))
                let newCenter = CGPoint(x: x, y: y)

                // Ensure new bubble fully inside safeRect
                let frame = CGRect(x: newCenter.x - radius, y: newCenter.y - radius, width: word.diameter, height: word.diameter)
                guard safeRect.contains(frame) else { continue }

                // Check for overlap with existing bubbles
                let intersects = placed.contains { existing in
                    let dx = existing.position.x - newCenter.x
                    let dy = existing.position.y - newCenter.y
                    let distance = sqrt(dx * dx + dy * dy)
                    return distance < (existing.item.radius + radius + 6) // +6 for padding
                }

                if !intersects {
                    placed.append(Bubble(id: word.id, item: word, position: newCenter))
                    hit = true
                }
            }
        }
        bubbles = placed
    }

    private func index(of bubble: Bubble) -> Int {
        bubbles.firstIndex { $0.id == bubble.id } ?? 0
    }
}

// MARK: - Preview
#Preview {
    ContentView()
}
