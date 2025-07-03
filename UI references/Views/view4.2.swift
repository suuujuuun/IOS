import SwiftUI

struct ContentView: View {
    
    @State private var rotationCount: Double = 0
    @State private var scale: CGFloat = 1
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 2)
                .foregroundColor(.black)
                .frame(width: 360, height: 360)
            
            Button(action: {
                withAnimation(.linear(duration: 1)) {
                    rotationCount += 360
                }
            }) {
                Circle()
                    .fill(
                        RadialGradient(
                            gradient: Gradient(colors: [.blue, .black.opacity(1)]),
                            center: .center,
                            startRadius: 0,
                            endRadius: 50
                        )
                    )
                    .frame(width: 50, height: 50)
            }
            .scaleEffect(scale)
            .offset(y: -180)
            .rotationEffect(.degrees(rotationCount)) 
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
