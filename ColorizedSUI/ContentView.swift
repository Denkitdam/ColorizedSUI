//
//  ContentView.swift
//  ColorizedSUI
//
//  Created by Denis Kitaev on 12.06.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var sliderValue = Double.random(in: 0...255)
    
    var body: some View {
        VStack {
            Rectangle()
                .frame(width: 350, height: 200)
                .cornerRadius(20)
            ColorSliderView(value: $sliderValue, color: .red)
            ColorSliderView(value: $sliderValue, color: .green)
            ColorSliderView(value: $sliderValue, color: .blue)
            Spacer()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ColorSliderView: View {
    @Binding var value: Double
    let color: Color
    
    var body: some View {
        HStack {
            Text("0").foregroundColor(color)
            Slider(value: $value, in: 0...255, step: 1).accentColor(color)
            Text("255").foregroundColor(color)
        }
    }
}
