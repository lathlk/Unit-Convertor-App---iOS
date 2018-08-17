//
//  UnitConvertorViewController.swift
//  Unit Convertor
//
//  Created by Lakshan Thilakarathne on 8/15/18.
//  Copyright © 2018 Lakshan Thilakarathne. All rights reserved.
//

import UIKit

class UnitConvertorViewController: UIViewController {

    @IBOutlet weak var txtGram: UITextField!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func txtFieldEditingChanged(_ sender: UITextField, forEvent event: UIEvent) {
        switch sender.tag {
        case 1...4:
            print("click on tag 1...4")
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
    
    func clearTextFields(){
        for tag in 1...4 {
            if let txtField = view.viewWithTag(tag) as? UITextField{
                txtField.text = nil
            }
        }
    }
}
