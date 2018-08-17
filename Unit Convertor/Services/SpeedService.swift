//
//  SpeedService.swift
//  Unit Convertor
//
//  Created by Lakshan Thilakarathne on 8/18/18.
//  Copyright © 2018 Lakshan Thilakarathne. All rights reserved.
//

import Foundation

class SpeedService {
    static func Convert(speed: Double, changed: SpeedTypes) -> Array<Double>{
        let metresPs = toMetresPs(speed: speed, type: changed)
        let feetsPm = feetsPerMinute(speed: metresPs)
        let kilometresPh = kilometresPerhour(speed: metresPs)
        let milesPh = milesPerhour(speed: metresPs)
        return [metresPs, feetsPm, kilometresPh, milesPh]
    }
    
    class func toMetresPs(speed: Double, type: SpeedTypes) -> Double {
        switch type {
        case .feetsPm:
            return speed/196.85
        case .kilometresPh:
            return speed/3.6
        case .milesPh:
            return speed/2.23694
        default:
            return speed
        }
    }
    
    // function: convert speeds value to feets per minute
    class func feetsPerMinute(speed : Double) -> Double{
        return speed*196.85
    }
    
    // function: convert speeds value to kilometres per hour
    class func kilometresPerhour(speed : Double) -> Double{
        return speed*3.6
    }
    
    // function: convert speeds value to miles per hour
    class func milesPerhour(speed : Double) -> Double{
        return speed*2.23694
    }
    
    // function: return the speed type respective to the Tag of field
    static func getSpeedType(tag: Int) -> SpeedTypes {
        switch tag {
        case 13:
            return .metresPs
        case 14:
            return .feetsPm
        case 15:
            return .kilometresPh
        default:
            return .milesPh
        }
    }
}

enum SpeedTypes {
    case metresPs
    case feetsPm
    case kilometresPh
    case milesPh
}
