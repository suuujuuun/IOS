import SwiftUI

struct CircleWord: Identifiable {
    let id = UUID()
    let word: String
    let position: CGPoint
    let size: CGFloat
    let importance: Int
}

struct ContentView: View {
    // Importance level: 3 = High, 2 = Medium, 1 = Low
    let weightedWords: [(String, Int)] = [
        ("give", 3), ("provide", 3), ("offer", 2), ("grant", 2),
        ("supply", 2), ("donate", 1), ("contribute", 1), ("deliver", 2),
        ("allocate", 1), ("distribute", 2), ("present", 1), ("furnish", 1),
        ("hand", 1), ("impart", 1), ("equip", 1), ("bestow", 1),
        ("yield", 1), ("extend", 1), ("assign", 1), ("render", 1)
    ]

    @State private var circles: [CircleWord] = []

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color.white.edgesIgnoringSafeArea(.all)

                ForEach(circles) { item in
                    ZStack {
                        Circle()
                            .fill(
                                RadialGradient(
                                    gradient: Gradient(colors: [.blue.opacity(0.3), .blue, .black.opacity(0.6)]),
                                    center: .center,
                                    startRadius: 0,
                                    endRadius: item.size / 1.5
                                )
                            )
                            .frame(width: item.size, height: item.size)

                        Text(item.word)
                            .font(font(for: item.importance))
                            .foregroundColor(.white)
                            .shadow(color: .black.opacity(0.4), radius: 2, x: 1, y: 1)
                    }
                    .position(item.position)
                }
            }
            .onAppear {
                circles = generateNonOverlappingCircles(in: geometry.size, weightedWords: weightedWords)
            }
        }
    }

    func font(for importance: Int) -> Font {
        switch importance {
        case 3:
            return .system(size: 26, weight: .heavy, design: .rounded)
        case 2:
            return .system(size: 20, weight: .semibold, design: .rounded)
        default:
            return .system(size: 16, weight: .regular, design: .rounded)
        }
    }

    func generateNonOverlappingCircles(in size: CGSize, weightedWords: [(String, Int)]) -> [CircleWord] {
        var result: [CircleWord] = []
        let maxAttempts = 1000

        for (word, importance) in weightedWords {
            var attempts = 0
            var newCircle: CircleWord?

            let radius: CGFloat
            switch importance {
            case 3: radius = 80
            case 2: radius = 60
            default: radius = 40
            }

            while attempts < maxAttempts {
                attempts += 1
                let x = CGFloat.random(in: radius...(size.width - radius))
                let y = CGFloat.random(in: radius...(size.height - radius))
                let newPosition = CGPoint(x: x, y: y)

                let overlaps = result.contains { existing in
                    let dx = existing.position.x - newPosition.x
                    let dy = existing.position.y - newPosition.y
                    let distance = sqrt(dx * dx + dy * dy)
                    return distance < ((existing.size / 2) + radius)
                }

                if !overlaps {
                    newCircle = CircleWord(word: word, position: newPosition, size: radius * 2, importance: importance)
                    break
                }
            }

            if let circle = newCircle {
                result.append(circle)
            }
        }

        return result
    }
}
struct ContentView_previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
