import SwiftUI

struct DefinitionView: View {
    let word: String
    let definition: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(word)
                .font(.title)
                .fontWeight(.bold)
            
            Text(definition)
                .font(.body)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(.ultraThinMaterial)
        .cornerRadius(20)
        .padding()
    }
}
