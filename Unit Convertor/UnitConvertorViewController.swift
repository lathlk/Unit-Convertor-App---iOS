//
//  UnitConvertorViewController.swift
//  Unit Convertor
//
//  Created by Lakshan Thilakarathne on 8/15/18.
//  Copyright © 2018 Lakshan Thilakarathne. All rights reserved.
//

import UIKit

class UnitConvertorViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let Tap : UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(DismissKeyboard))
        
        view.addGestureRecognizer(Tap)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func txtFieldEditingChanged(_ sender: UITextField, forEvent event: UIEvent) {
        if let txtField = view.viewWithTag(sender.tag) as? UITextField {
            if let text = txtField.text {
                if text.isEmpty {
                    clearTextFields()
                }
                else{
                    if let txtFieldTextAsDouble = Double(text){
                        switch sender.tag {
                        case 1...4:
                            let weights = WeightService.Convert(weight: txtFieldTextAsDouble, changed: WeightService.getWeightType(tag: sender.tag))
                            var tags = [1,2,3,4]
                            tags.remove(at: sender.tag-1)
                            updateUI(values: weights, startTag: 1, tags: tags)
                        case 5...7:
                            let temps = TemperatureService.Convert(temp: txtFieldTextAsDouble, changed: TemperatureService.getTempType(tag: sender.tag))
                            var tags = [5,6,7]
                            tags.remove(at: sender.tag-5)
                            updateUI(values: temps, startTag: 5, tags: tags)
                        case 8...12:
                            let distances = DistanceService.Convert(distance: txtFieldTextAsDouble, changed: DistanceService.getDistanceType(tag: sender.tag))
                            var tags = [8,9,10,11,12]
                            tags.remove(at: sender.tag-8)
                            updateUI(values: distances, startTag: 8, tags: tags)
                        case 13...16:
                            let speeds = SpeedService.Convert(speed: txtFieldTextAsDouble, changed: SpeedService.getSpeedType(tag: sender.tag))
                            var tags = [13,14,15,16]
                            tags.remove(at: sender.tag-13)
                            updateUI(values: speeds, startTag: 13, tags: tags)
                        default:
                            print("Invalid tag")
                        }
                    }
                }
            }
        }
    }
    
    // function: clear all the text fields
    func clearTextFields(){
        for tag in 1...15 {
            if let txtField = view.viewWithTag(tag) as? UITextField{
                txtField.text = nil
            }
        }
    }
    
    // function: update all the text fields with converted values
    func updateUI(values: Array<Double>, startTag: Int, tags: Array<Int>){
        switch startTag {
            case 1:
                for tag in tags {
                    if let txtField = view.viewWithTag(tag) as? UITextField{
                        txtField.text = String(values[tag-1])
                    }
                }
            case 5:
                for tag in tags {
                    if let txtField = view.viewWithTag(tag) as? UITextField{
                        txtField.text = String(values[tag-5])
                    }
                }
            case 8:
                for tag in tags {
                    if let txtField = view.viewWithTag(tag) as? UITextField{
                        txtField.text = String(values[tag-8])
                    }
                }
            case 13:
                for tag in tags {
                    if let txtField = view.viewWithTag(tag) as? UITextField{
                        txtField.text = String(values[tag-13])
                    }
                }
            default:
                print("Error")
            }
    }
    
    // function to hide keyboard
    @objc func DismissKeyboard(){
        view.endEditing(true)
    }
}
