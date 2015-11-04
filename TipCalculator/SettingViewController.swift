//
//  SettingViewController.swift
//  TipCalculator
//
//  Created by Thuan Nguyen on 11/5/15.
//  Copyright © 2015 Thuan Nguyen. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {

    
    @IBOutlet weak var txtDefaultPercentage: UITextField!
    var defaultPercentValue = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        txtDefaultPercentage.text = "\(defaultPercentValue)"
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func backAction(sender: AnyObject) {
//        self.dismissViewControllerAnimated(true) { [weak self] in
//            
//        let passingObject = self!.txtDefaultPercentage.text
//            
//        NSNotificationCenter.defaultCenter().postNotificationName("passingObjectsFromSettingNotification", object: passingObject)
//        print("posted notification")
//            
//        }
        
        let passingObject = self.txtDefaultPercentage.text
        
    NSNotificationCenter.defaultCenter().postNotificationName("passingObjectsFromSettingNotification", object: passingObject)
                print("posted notification")
        self.dismissViewControllerAnimated(true, completion: nil)
    }

}
