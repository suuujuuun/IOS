import SwiftUI
import CoreData

struct ContentView: View {
    
    private var colors: [Color] = [.blue, .yellow, .green]
    private var gridItems = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        
        ScrollView{
            LazyVGrid(columns: gridItems, spacing: 5) {
                ForEach(0...99, id: \.self) { index in
                    CellContent(index: index, color: colors[index % colors.count])
                }
            }
            .padding(5)
        }
    }
}


struct CellContent: View {
    var index: Int
    var color: Color
    
    var body: some View {
        Text("\(index)")
            .frame(minWidth: 50, maxWidth: .infinity, minHeight: 100)
            .background(color)
            .cornerRadius(8)
            .font(.system(.largeTitle))
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
