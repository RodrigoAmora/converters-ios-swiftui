//
//  TemperatureViewModel.swift
//  converters-ios
//
//  Created by Rodrigo Amora on 23/09/22.
//

import Foundation

class TemperatureViewModel {
    func fahrenheitToCelsius(temperature: Double) -> Double {
        return 32.0
    }
    
    func celisusToFahrenheit(temperature: Double) -> Double {
        return ((Double(temperature) ) * 9/5) + 32
    }
}
