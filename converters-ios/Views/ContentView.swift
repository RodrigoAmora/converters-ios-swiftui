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
    @State var selectedOptionIndex = 0
    
    var body: some View {
        let options: [String] = ["Celsius para Fahrenheit",
                                 "Fahrenheit para Celsius"]
        
        VStack{
            TextField("Digite a temepratua", text: $temperature)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.decimalPad)
                .padding(.trailing, 15)
                .padding(.leading, 15)
            
            Picker("Escolha uma opção", selection: $selectedOptionIndex, content: {
                ForEach(0..<options.count, content: { index in // <2>
                    Text(options[index]) // <3>
                })
            })
            
            Button(action: {}) {
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
            .padding(.top, 7)
            
            Text(String(temperatureConverted))
                .padding(.top, 20)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
