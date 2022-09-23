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

    @State private var value: String = ""
    @State private var valueConverted: Double = 0.0
    
    var onColors = [Color.red, Color.yellow]
    var offColors = [Color(white: 0.6), Color(white: 0.4)]

    var body: some View {
        VStack{
            TextField(placeholderTextField, text: $value)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.decimalPad)
                .padding(.trailing, 15)
            
            Button(action: {
                valueConverted = ((Double(value) ?? 0.0) * 9/5) + 32
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
