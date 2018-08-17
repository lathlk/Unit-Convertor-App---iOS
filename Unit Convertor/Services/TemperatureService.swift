//
//  TemperatureService.swift
//  Unit Convertor
//
//  Created by Lakshan Thilakarathne on 8/18/18.
//  Copyright © 2018 Lakshan Thilakarathne. All rights reserved.
//

import Foundation

class TemperatureService {
    static func Convert(temp: Double, changed: TempTypes) -> Array<Double>{
        let celsius = toCelsius(temp: temp, type: changed)
        let fahrenheit = celsiusToFahrenheit(temp: celsius)
        let kelvin = celsiusToKelvin(temp: celsius)
        return [celsius, fahrenheit, kelvin]
    }
    
    class func toCelsius(temp: Double, type: TempTypes) -> Double {
        switch type {
        case .fahrenheit:
            return (temp-32)*5/9
        case .kelvin:
            return temp-273
        default:
            return temp
        }
    }
    
    // function: convert celsius value to fahrenheit
    class func celsiusToFahrenheit(temp : Double) -> Double{
        return (temp*9/5)+32
    }
    
    // function: convert celsius value to kelvin
    class func celsiusToKelvin(temp : Double) -> Double{
        return temp+273
    }
    
    // function: return the weight type respective to the Tag of field
    static func getTempType(tag: Int) -> TempTypes {
        switch tag {
        case 5:
            return .celsius
        case 6:
            return .fahrenheit
        default:
            return .kelvin
        }
    }
}

enum TempTypes {
    case celsius
    case fahrenheit
    case kelvin
}
