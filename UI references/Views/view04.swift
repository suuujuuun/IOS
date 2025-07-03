import SwiftUI

struct ContentView: View {
    
    
    let colors = Gradient(colors: [Color.green, Color.blue, Color.purple])
    
    var body: some View {
        
        Circle()
            .fill(
                RadialGradient(
                    gradient: Gradient(colors: [.black.opacity(0.2), .blue, .black.opacity(0.7)]),
                    center: .center,
                    startRadius: 0,
                    endRadius: 150
                )
            )
            .frame(width: 200,height: 200)
                
    }
    
}

struct ContentView_previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
