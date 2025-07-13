import SwiftUI

struct LicenseView: View {
    @Binding var isPresented: Bool
    @Environment(\.openURL) var openURL

    var body: some View {
        ZStack(alignment: .topTrailing) {
            Color(red: 0.95, green: 0.95, blue: 0.97).ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 20) {
                Text("License & Acknowledgements")
                    .font(.system(.largeTitle, design: .rounded))
                    .fontWeight(.bold)
                    .padding(.top, 40)

                Text("This application is made possible by the following open-source projects and APIs. We are incredibly grateful to the developers and communities who make them available.")
                    .font(.body)
                    .lineSpacing(5)

                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        // Stanford GloVe
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Stanford GloVe")
                                .font(.headline)
                                .fontWeight(.bold)
                            Text("Provides the core word vector model for calculating synonym relationships. GloVe is an unsupervised learning algorithm for obtaining vector representations for words.")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                            Button("Learn more about GloVe") { 
                                openURL(URL(string: "https://nlp.stanford.edu/projects/glove/")!)
                            }
                                .font(.caption)
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(15)
                        .shadow(color: .black.opacity(0.05), radius: 5, x: 0, y: 2)

                        // English Word Frequency
                        VStack(alignment: .leading, spacing: 8) {
                            Text("English Word Frequency")
                                .font(.headline)
                                .fontWeight(.bold)
                            Text("The word list used in this app is based on the frequency list from hermitdave/FrequencyWords, provided under the MIT License.")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                            Button("View on GitHub") { 
                                openURL(URL(string: "https://github.com/hermitdave/FrequencyWords")!)
                            }
                                .font(.caption)
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(15)
                        .shadow(color: .black.opacity(0.05), radius: 5, x: 0, y: 2)

                        // DictionaryAPI.dev
                        VStack(alignment: .leading, spacing: 8) {
                            Text("DictionaryAPI.dev")
                                .font(.headline)
                                .fontWeight(.bold)
                            Text("Provides word definitions under the CC BY-SA 3.0 license when a user long-presses on a word bubble.")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                            Button("Visit DictionaryAPI.dev") { 
                                openURL(URL(string: "https://dictionaryapi.dev/")!)
                            }
                                .font(.caption)
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(15)
                        .shadow(color: .black.opacity(0.05), radius: 5, x: 0, y: 2)
                    }
                }

                Spacer()
            }
            .padding(.horizontal, 25)

            Button(action: { isPresented = false }) {
                Image(systemName: "xmark.circle.fill")
                    .font(.largeTitle)
                    .foregroundColor(.gray.opacity(0.7))
            }
            .padding()
        }
    }
}
