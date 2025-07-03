import SwiftUI
import PlaygroundSupport

struct ExampleView: View {
    
    @State private var rotation: Double = 0
    
    var body: some View {
        VStack {
            Rectangle()
                .fill(Color.blue)
                .frame(width: 200, height: 200)
                .rotationEffect(Angle(degrees: rotation))
            Button(action: {
                rotation = (rotation < 360 ? rotation + 60 : 0)
            }) {
                Text("Rotate")
            }
            .padding(10)
        }
    }
}

// This line is really important!
PlaygroundPage.current.setLiveView(ExampleView()
    .padding(100))
