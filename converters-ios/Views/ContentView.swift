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
        let options: [String] = ["Celsius para Fahrenheit",
                                 "Fahrenheit para Celsius"]
        
        NavigationView {
            GeometryReader { view in
                VStack {
                    ConverterComponent(placeholderTextField: "Temperatura em Celsius", options: options)
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
