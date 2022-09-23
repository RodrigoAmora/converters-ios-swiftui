//
//  ContentView.swift
//  converters-ios
//
//  Created by Rodrigo Amora on 13/08/22.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    @State private var temperature: String = ""
    @State private var temperatureConverted: Double = 0.0
    
    var body: some View {
        NavigationView {
            GeometryReader { view in
                VStack {
                        
                    TextField("Teperatura en Celsius", text: $temperature)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.decimalPad)
                        
                        .padding(20)
                        
                    
                    Button(action: {
                        temperatureConverted = ((Double(temperature) ?? 0.0) * 9/5) + 32
                    }) {
                        Text("Converter")
                            .font(.custom("Avenir Medium", size: self.horizontalSizeClass == .compact ? 17 : 24))
                            .foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
                    }
                    .frame(width: self.horizontalSizeClass == .compact ? 100 : 150,
                           height: self.horizontalSizeClass == .compact ? 50 : 75,
                           alignment: .center)
                    .overlay(RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.orange, lineWidth: 10))
                    .background(.orange)
                    
                    Text(String(temperatureConverted))
                        .padding(.top, 20)
                    
                    
                }
                .padding(.top, 100)
                .padding(.leading, 15)
                
            }.edgesIgnoringSafeArea(.all)
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
