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
