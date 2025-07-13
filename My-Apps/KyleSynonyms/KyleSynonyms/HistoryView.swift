import SwiftUI

struct HistoryView: View {
    
    @EnvironmentObject var themeManager: ThemeManager
    @Binding var isPresented: Bool
    @Binding var searchHistory: [String]
    var onSelectWord: (String) -> Void // Add a closure for word selection

    var body: some View {
        ZStack(alignment: .topTrailing) {
            themeManager.currentTheme.secondaryBackgroundColor.ignoresSafeArea()

            VStack {
                Text("Search History")
                    .font(.system(.largeTitle, design: .rounded))
                    .fontWeight(.bold)
                    .padding(.top, 40)

                if searchHistory.isEmpty {
                    VStack {
                        Spacer()
                        Text("No recent searches.")
                            .font(.headline)
                            .foregroundColor(.gray)
                        Spacer()
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                } else {
                    List {
                        ForEach(searchHistory, id: \.self) { word in
                            Button(action: {
                                onSelectWord(word)
                                isPresented = false // Close the sheet after selection
                            }) {
                                Text(word)
                                    .font(.system(.body, design: .rounded))
                                    .foregroundColor(.primary) // Ensure text color is visible
                            }
                        }
                        .onDelete(perform: delete)
                    }
                    .listStyle(InsetGroupedListStyle())
                }
                
                if !searchHistory.isEmpty { // Only show Clear All button if history is not empty
                    Button(action: {
                        searchHistory.removeAll()
                    }) {
                        Text("Clear All")
                            .font(.headline)
                            .foregroundColor(.red)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(color: .black.opacity(0.05), radius: 5, x: 0, y: 2)
                    }
                    .padding(.horizontal)
                    .padding(.bottom)
                }
            }
            .padding(.top)

            Button(action: { isPresented = false }) {
                Image(systemName: "xmark.circle.fill")
                    .font(.largeTitle)
                    .foregroundColor(.gray.opacity(0.7))
            }
            .padding()
        }
    }

    private func delete(at offsets: IndexSet) {
        searchHistory.remove(atOffsets: offsets)
    }
}
