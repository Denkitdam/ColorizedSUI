//
//  ContentView.swift
//  ColorizedSUI
//
//  Created by Denis Kitaev on 12.06.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var redSliderValue = Double.random(in: 0...255)
    @State private var greenSliderValue = Double.random(in: 0...255)
    @State private var blueSliderValue = Double.random(in: 0...255)
    
    var body: some View {
        VStack {
            Rectangle()
                .frame(width: 350, height: 200)
                .cornerRadius(20)
                .foregroundColor(
                    Color(
                        red: redSliderValue / 255,
                        green: greenSliderValue / 255,
                        blue: blueSliderValue / 255
                    )
                )
            
            ColorSliderView(value: $redSliderValue, color: .red)
            ColorSliderView(value: $greenSliderValue, color: .green)
            ColorSliderView(value: $blueSliderValue, color: .blue)
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
            Slider(value: $value, in: 0...255, step: 1).accentColor(color)
            Text("\(lround(value))")
                .foregroundColor(color)
                .frame(width: 45)
        }
    }
}
