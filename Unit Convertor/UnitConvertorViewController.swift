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
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func clearTextFields(){
        for tag in 1...4 {
            if let txtField = view.viewWithTag(tag) as? UITextField{
                txtField.text = nil
            }
        }
    }
}
