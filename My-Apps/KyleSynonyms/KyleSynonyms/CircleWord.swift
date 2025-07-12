import SwiftUI

struct CircleWord: Identifiable, Decodable {
    let id = UUID()
    let word: String
    let score: Double
    var fixedRadius: CGFloat? = nil // << 1. 고정 반지름 프로퍼티 추가

    enum CodingKeys: String, CodingKey {
        case word
        case score
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.word = try container.decode(String.self, forKey: .word)
        self.score = try container.decode(Double.self, forKey: .score)
    }

    init(word: String, score: Double, fixedRadius: CGFloat? = nil) {
        self.word = word
        self.score = score
        self.fixedRadius = fixedRadius
    }

    var radius: CGFloat {
        // << 2. 고정 반지름이 있으면 그 값을 사용
        if let fixedRadius { return fixedRadius }
        
        // 기존 로직
        let minRadius: CGFloat = 40.0
        let maxRadius: CGFloat = 90.0
        let baseSize: CGFloat = 30.0
        let sizePerCharacter: CGFloat = 4.0
        
        let calculatedRadius = baseSize + (CGFloat(word.count) * sizePerCharacter)
        
        return min(max(minRadius, calculatedRadius), maxRadius)
    }
    
    var diameter: CGFloat { radius * 2 }
}
