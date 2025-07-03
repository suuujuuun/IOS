import SwiftUI

struct ContentView: View {
    
    @State private var rotation: Double = 0
    @State private var scale: CGFloat = 1
    
    let colors = Gradient(colors: [Color.green, Color.blue, Color.purple])
    
    var body: some View {
        
        Button(action: {
            self.rotation = (self.rotation < 360 ? self.rotation + 60 : 0)
            self.scale = (self.scale < 2.8 ? self.scale + 0.3 : 1)
        }){
            Text("Click to animate")
                .scaleEffect(scale)
                .rotationEffect(.degrees(rotation))
                .animation(.linear(duration: 1), value: rotation)
        }
        
        Button(action: {
            self.rotation = (self.rotation < 360 ? self.rotation + 60 : 0)
            self.scale = (self.scale < 2.8 ? self.scale + 0.3 : 1)}){

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
                .scaleEffect(scale)
                .rotationEffect(.degrees(rotation))
                .animation(.linear(duration: 1), value: rotation)
            
        }
    }
    
}

struct ContentView_previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
