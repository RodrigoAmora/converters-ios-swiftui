//
//  ConverterComponent.swift
//  converters-ios
//
//  Created by Rodrigo Amora on 23/09/22.
//

import SwiftUI

struct ConverterComponent: View {

    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    let placeholderTextField: String
    let options: [String]
    let option: OptionsEnum
    
    @State private var value: String = ""
    @State private var valueConverted: Double = 0.0
    @State var selectedOptionIndex = 0

    var body: some View {
        VStack{
            TextField(placeholderTextField, text: $value)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.decimalPad)
                .padding(.trailing, 15)
            
            Picker("Escolha uma opção", selection: $selectedOptionIndex, content: {
                ForEach(0..<options.count, content: { index in // <2>
                    Text(options[index]) // <3>
                })
            })
            
            Button(action: {
                if(option == OptionsEnum.temperature) {
                    if(selectedOptionIndex == 0) {
                        valueConverted = TemperatureViewModel().celisusToFahrenheit(temperature: Double(value))
                    }
                }
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
            .padding(.top, 7)
            
            Text(String(valueConverted))
                .padding(.top, 20)
        }
    }
}
