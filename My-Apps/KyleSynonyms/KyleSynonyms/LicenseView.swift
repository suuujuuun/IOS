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


                        // Free Dictionary API
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Free Dictionary API")
                                .font(.headline)
                                .fontWeight(.bold)
                            Text("Provides word definitions when a user long-presses on a word bubble.")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                            Button("Visit Free Dictionary API") { 
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
