
import SwiftUI

// MARK: - Bubble Layout Manager
class BubbleLayoutManager {
    static func layoutBubbles(in size: CGSize, wordsToLayout: [CircleWord], centralWord: String) -> [ContentView.Bubble] {
        var placed: [ContentView.Bubble] = []
        let center = CGPoint(x: size.width / 2, y: size.height / 2)

        // Filter out the central word, sort by score, and take the top 15
        let sortedSynonyms = wordsToLayout.filter { $0.word.lowercased() != centralWord.lowercased() }
                                          .sorted { $0.score > $1.score }
        let topSynonyms = Array(sortedSynonyms.prefix(15))

        let padding: CGFloat = 15 // Padding from screen edges
        let centralBubble = CircleWord(word: centralWord, score: 1.0)
        let centralBubbleRadius = centralBubble.radius

        let maxAttemptsPerBubble = 15000 // Increase attempts even more
        let minDistanceBetweenBubbles: CGFloat = 5 // Keep it tight

        // Place bubbles one by one with collision detection
        for word in topSynonyms {
            var attempt = 0
            var placedSuccessfully = false

            while attempt < maxAttemptsPerBubble && !placedSuccessfully {
                attempt += 1

                // Generate a random position within the entire screen bounds (respecting padding)
                let randomX = CGFloat.random(in: padding + word.radius...size.width - word.radius - padding)
                let randomY = CGFloat.random(in: padding + word.radius...size.height - word.radius - padding)
                let newCenter = CGPoint(x: randomX, y: randomY)

                // --- Collision Detection --- 
                var overlaps = false

                // 1. Check for overlap with the central bubble
                let dxCentral = center.x - newCenter.x
                let dyCentral = center.y - newCenter.y
                let distanceCentral = sqrt(dxCentral * dxCentral + dyCentral * dyCentral)
                if distanceCentral < (centralBubbleRadius + word.radius + minDistanceBetweenBubbles) {
                    overlaps = true
                }

                // 2. Check for overlap with other already placed bubbles
                if !overlaps {
                    for existingBubble in placed {
                        let dx = existingBubble.position.x - newCenter.x
                        let dy = existingBubble.position.y - newCenter.y
                        let distance = sqrt(dx * dx + dy * dy)
                        if distance < (existingBubble.item.radius + word.radius + minDistanceBetweenBubbles) {
                            overlaps = true
                            break
                        }
                    }
                }

                // If no overlaps, place the bubble
                if !overlaps {
                    placed.append(ContentView.Bubble(id: word.id, item: word, position: newCenter))
                    placedSuccessfully = true
                }
            }
            // If a spot isn't found after max attempts, it's skipped. 
            // With the new algorithm, this is much less likely.
        }

        return placed
    }
}
