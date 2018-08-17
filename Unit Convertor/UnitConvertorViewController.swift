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
                            let weights = Weight.Convert(weight: txtFieldTextAsDouble, changed: getWeightType(tag: sender.tag))
                            var tags = [1,2,3,4]
                            tags.remove(at: sender.tag-1)
                            updateUI(values: weights, startTag: 1, tags: tags)
                        case 5...9:
                            print("click on tag 5...9")
                        case 10...14:
                            print("click on tag 10...14")
                        case 15...19:
                            print("click on tag 15...19")
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
        for tag in 1...16 {
            if let txtField = view.viewWithTag(tag) as? UITextField{
                txtField.text = nil
            }
        }
    }
    
    // function: return the weight type respective to the Tag of field
    func getWeightType(tag: Int) -> WeightTypes {
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
    
    // function: update all the text fields with converted values
    func updateUI(values: Array<Double>, startTag: Int, tags: Array<Int>){
        switch startTag {
            case 1:
                for tag in tags {
                    if let txtField = view.viewWithTag(tag) as? UITextField{
                        txtField.text = String(values[tag-1])
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
