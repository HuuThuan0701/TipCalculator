//
//  ViewController.swift
//  TipCalculator
//
//  Created by Thuan Nguyen on 9/23/15.
//  Copyright © 2015 Thuan Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        var tipPercentages = [0.1, 0.15, 0.2]
        let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        var billAmount = Double(billField.text!)
        if billAmount == nil {
            billAmount = 0
        }
        let tip = Double(billAmount! * tipPercentage)
        let total = tip + billAmount!
        
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}

