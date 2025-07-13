
import SwiftUI

struct CircleWord: Identifiable, Decodable {
    let id = UUID()
    let word: String
    let score: Double
    let level: String
    let isCore: Bool
    var fixedRadius: CGFloat? = nil

    enum CodingKeys: String, CodingKey {
        case word, score, level
        case isCore = "is_core"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.word = try container.decode(String.self, forKey: .word)
        self.score = try container.decode(Double.self, forKey: .score)
        self.level = try container.decodeIfPresent(String.self, forKey: .level) ?? "intermediate"
        self.isCore = try container.decodeIfPresent(Bool.self, forKey: .isCore) ?? false
    }

    init(word: String, score: Double, level: String = "intermediate", isCore: Bool = false, fixedRadius: CGFloat? = nil) {
        self.word = word
        self.score = score
        self.level = level
        self.isCore = isCore
        self.fixedRadius = fixedRadius
    }

    var radius: CGFloat {
        if let fixedRadius { return fixedRadius }
        let minRadius: CGFloat = 40.0
        let maxRadius: CGFloat = 90.0
        let baseSize: CGFloat = 30.0
        let sizePerCharacter: CGFloat = 4.0
        let calculatedRadius = baseSize + (CGFloat(word.count) * sizePerCharacter)
        return min(max(minRadius, calculatedRadius), maxRadius)
    }
    
    var diameter: CGFloat { radius * 2 }
}

// A view to draw the decorative ring (torus)
struct RingView: View {
    let color: Color
    let rotationDegrees: Double
    
    var body: some View {
        Torus()
            .stroke(color, lineWidth: 5)
            .rotation3DEffect(
                .degrees(rotationDegrees),
                axis: (x: 1, y: 0.5, z: 0)
            )
    }
}

// A simple Torus shape
struct Torus: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let majorRadius = min(rect.width, rect.height) / 2
        let minorRadius = majorRadius * 0.1 // Adjust for thickness
        let center = CGPoint(x: rect.midX, y: rect.midY)
        
        path.addEllipse(in: CGRect(
            x: center.x - majorRadius,
            y: center.y - majorRadius,
            width: majorRadius * 2,
            height: majorRadius * 2
        ))
        
        path.addEllipse(in: CGRect(
            x: center.x - (majorRadius - minorRadius),
            y: center.y - (majorRadius - minorRadius),
            width: (majorRadius - minorRadius) * 2,
            height: (majorRadius - minorRadius) * 2
        ))
        
        return path
    }
}

