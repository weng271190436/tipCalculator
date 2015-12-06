//
//  ViewController.swift
//  tips
//
//  Created by WENG on 15/12/1.
//  Copyright © 2015年 wengwei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        let defaults = NSUserDefaults.standardUserDefaults()
        let defaultTipPercentage = defaults.integerForKey("defaultTipPercentage")
        if (defaultTipPercentage == 0) {
            tipControl.selectedSegmentIndex = 0;
        }
        else if (defaultTipPercentage == 1) {
            tipControl.selectedSegmentIndex = 1;
        }
        else if (defaultTipPercentage == 2) {
            tipControl.selectedSegmentIndex = 2;
        }
        else {
            tipControl.selectedSegmentIndex = 1;
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        let defaults = NSUserDefaults.standardUserDefaults()
        let defaultTipPercentage = defaults.integerForKey("defaultTipPercentage")
        if (defaultTipPercentage == 0) {
            tipControl.selectedSegmentIndex = 0;
        }
        else if (defaultTipPercentage == 1) {
            tipControl.selectedSegmentIndex = 1;
        }
        else if (defaultTipPercentage == 2) {
            tipControl.selectedSegmentIndex = 2;
        }
        else {
            tipControl.selectedSegmentIndex = 1;
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        print("view did disappear")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        var tipPercentages = [0.15, 0.2, 0.25]
        let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        let billAmount = (billField.text! as NSString).doubleValue
        let tip = billAmount * tipPercentage
        let total = billAmount + tip
        
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}

