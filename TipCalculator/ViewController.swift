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
    @IBOutlet weak var tipPercentageLabel: UILabel!
    @IBOutlet weak var tipPercentageSlider: UISlider!
    @IBOutlet weak var peopleLabel: UILabel!
    @IBOutlet weak var peopleShare: UILabel!
    @IBOutlet weak var peopleStepper: UIStepper!

    var defaultPercent = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let numberFormater = NSNumberFormatter()
        numberFormater.numberStyle = NSNumberFormatterStyle.CurrencyStyle
        
        tipLabel.text = numberFormater.stringFromNumber(0)
        totalLabel.text = tipLabel.text
        peopleShare.text = totalLabel.text
        tipPercentageLabel.text = "10%"
        billField.becomeFirstResponder()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "updateDefaultPercentage:", name: "passingObjectsFromSettingNotification", object: nil)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        self.view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        calculateTip()
    }
    
    func calculateTip(){
        let tipPercentage = Int(round(tipPercentageSlider.value))
        
        var billAmount = Double(billField.text!)
        if billAmount == nil {
            billAmount = 0
        }
        
        let tip = billAmount! * Double(tipPercentage) / 100
        let total = tip + billAmount!
        
        let people = Int(peopleStepper.value)
        let peopleEach = round(total / Double(people) * 100) / 100
        
        let numberFormater = NSNumberFormatter()
        numberFormater.numberStyle = NSNumberFormatterStyle.CurrencyStyle
        
        tipLabel.text = numberFormater.stringFromNumber(tip)
        totalLabel.text = numberFormater.stringFromNumber(total)
        tipPercentageLabel.text = "\(tipPercentage)%"
        peopleLabel.text = "\(people) People"
        peopleShare.text = numberFormater.stringFromNumber(peopleEach)
    }
    
    func updateDefaultPercentage(notif:NSNotification) {
        
        defaultPercent = (notif.object?.integerValue)!
        let receivedValue = notif.object?.floatValue
        if let theReceivedValue = receivedValue {
            
            tipPercentageLabel.text = "\(Int(theReceivedValue))%"
            if theReceivedValue > tipPercentageSlider.maximumValue {
                tipPercentageSlider.maximumValue = theReceivedValue
            }
            tipPercentageSlider.value = theReceivedValue
        }
        
        calculateTip()
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showSettings" {
            let settingViewController = segue.destinationViewController as! SettingViewController
            if defaultPercent == 0 {
                defaultPercent = Int(tipPercentageSlider.value)
            }
            settingViewController.defaultPercentValue = defaultPercent
        }
    }
}

