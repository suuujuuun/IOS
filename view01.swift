import SwiftUI
import CoreData

struct ContentView: View {
    
    @State private var color: Color = .black
    var body : some View {
        
        VStack{
            Image(systemName: "globe.allowsTightening(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
            
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .italic()
                .bold()
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .foregroundColor(color)
            
            Button(/*@START_MENU_TOKEN@*/"Button"/*@END_MENU_TOKEN@*/) {
                color = Color(
                    red: .random(in: 0...1),
                    green: .random(in: 0...1),
                    blue: .random(in: 0...1)
                )
            }}
        Text("goodbye world")

        
        .padding(10)
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
