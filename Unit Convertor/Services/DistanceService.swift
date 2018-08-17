//
//  DistanceService.swift
//  Unit Convertor
//
//  Created by Lakshan Thilakarathne on 8/18/18.
//  Copyright © 2018 Lakshan Thilakarathne. All rights reserved.
//

import Foundation

class DistanceService {
    static func Convert(distance: Double, changed: DistanceTypes) -> Array<Double>{
        let metres = toMetre(distance: distance, type: changed)
        let foot = metreToFoot(distance: metres)
        let yard = metreToYard(distance: metres)
        let kilometre = metreToKilometre(distance: metres)
        let mile = metreToMile(distance: metres)
        return [metres, foot, yard, kilometre, mile]
    }
    
    class func toMetre(distance: Double, type: DistanceTypes) -> Double {
        switch type {
        case .foot:
            return distance*12/39.37
        case .yard:
            return distance*3600/3937
        case .kilometre:
            return distance*1000
        case .mile:
            return distance/0.000621371
        default:
            return distance
        }
    }
    
    // function: convert metres value to foots
    class func metreToFoot(distance : Double) -> Double{
        return distance*39.37/12
    }
    
    // function: convert metres value to yards
    class func metreToYard(distance : Double) -> Double{
        return distance*3937/3600
    }
    
    // function: convert metres value to kilometres
    class func metreToKilometre(distance : Double) -> Double{
        return distance/1000
    }
    
    // function: convert metres value to miles
    class func metreToMile(distance : Double) -> Double{
        return distance*0.000621371
    }
    
    // function: return the distance type respective to the Tag of field
    static func getDistanceType(tag: Int) -> DistanceTypes {
        switch tag {
        case 8:
            return .metre
        case 9:
            return .foot
        case 10:
            return .yard
        case 11:
            return .kilometre
        default:
            return .mile
        }
    }
}

enum DistanceTypes {
    case metre
    case foot
    case yard
    case kilometre
    case mile
}
