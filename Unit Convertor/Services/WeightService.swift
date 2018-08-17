//
//  WeightService.swift
//  Unit Convertor
//
//  Created by Lakshan Thilakarathne on 8/17/18.
//  Copyright © 2018 Lakshan Thilakarathne. All rights reserved.
//

import Foundation

class WeightService {
    static func Convert(weight: Double, changed: WeightTypes) -> Array<Double>{
        let grams = toGram(weight, changed)
        let kilograms = gramToKilograms(gram: grams)
        let pounds = gramToPounds(gram: grams)
        let ounces = gramToOunces(gram: grams)
        return [grams, kilograms, pounds, ounces]
    }
    
    class func toGram(_ weight: Double,_ type: WeightTypes) -> Double {
        switch type {
        case .kilogram:
            return weight*1000
        case .pounds:
            return weight*453.592
        case .ounce:
            return weight*28.3495
        default:
            return weight
        }
    }
    
    // function: convert gram value to kilograms
    class func gramToKilograms(gram : Double) -> Double{
        return gram/1000
    }
    
    // function: convert gram value to pounds
    class func gramToPounds(gram : Double) -> Double{
        return gram/453.592
    }
    
    // function: convert gram value to ounces
    class func gramToOunces(gram : Double) -> Double{
        return gram/28.3495
    }
    
    // function: return the weight type respective to the Tag of field
    static func getWeightType(tag: Int) -> WeightTypes {
        switch tag {
        case 1:
            return .gram
        case 2:
            return .kilogram
        case 3:
            return .pounds
        default:
            return .ounce
        }
    }
}

enum WeightTypes {
    case gram
    case kilogram
    case pounds
    case ounce
}
