//
//  ContentView.swift
//  Small animation
//



import SwiftUI

struct ContentView: View {
    @AppStorage("lightsOn") private var lightsOn: Bool =
    false
    private var backgroundColor: Color {
        lightsOn ? .white : .black
    }
    private var imageName: String {
        lightsOn ? "sun.max.fill" : "moon.fill"
    }
    private var imageColor: Color {
        lightsOn ? .yellow : .blue
    }
    private var text: String {
        lightsOn ? "Turn the light off!" : "Turn the light on!"
    }
    @State private var rotation: Double = 0
    
    var body: some View {
        ZStack {
            backgroundColor.ignoresSafeArea(.all)
            
            VStack(alignment: .center) {
                Spacer()
                Image(systemName: imageName)
                    .font(.system(size: 88))
                    .foregroundColor(imageColor)
                    .padding()
                    .rotationEffect(.degrees(rotation))
                    .animation(.easeInOut(duration: 1))
                Spacer()
                Text(text)
                    .font(.largeTitle)
                    .bold()
                    .animation(.none)
                Toggle("", isOn: $lightsOn)
                    .labelsHidden()
            }
            .foregroundColor(lightsOn ? .black : .white)
            .onChange(of: lightsOn, perform: {
                value in
                if value {
                    rotation += 360
                } else {
                    rotation -= 360
                }
            })
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
