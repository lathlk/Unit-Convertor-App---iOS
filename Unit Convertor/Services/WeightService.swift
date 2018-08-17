//
//  WeightService.swift
//  Unit Convertor
//
//  Created by Lakshan Thilakarathne on 8/17/18.
//  Copyright © 2018 Lakshan Thilakarathne. All rights reserved.
//

import Foundation

class Weight {
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
    
    class func gramToKilograms(gram : Double) -> Double{
        return gram/1000
    }
    
    class func gramToPounds(gram : Double) -> Double{
        return gram/453.592
    }
    
    class func gramToOunces(gram : Double) -> Double{
        return gram/28.3495
    }
}

enum WeightTypes {
    case gram
    case kilogram
    case pounds
    case ounce
}
