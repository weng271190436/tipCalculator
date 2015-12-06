//
//  SettingsViewController.swift
//  tips
//
//  Created by WENG on 15/12/3.
//  Copyright © 2015年 wengwei. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultTipControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let defaults = NSUserDefaults.standardUserDefaults()
        let defaultTipPercentage = defaults.integerForKey("defaultTipPercentage")
        if (defaultTipPercentage == 0) {
            defaultTipControl.selectedSegmentIndex = 0;
        }
        else if (defaultTipPercentage == 1) {
            defaultTipControl.selectedSegmentIndex = 1;
        }
        else if (defaultTipPercentage == 2) {
            defaultTipControl.selectedSegmentIndex = 2;
        }
        else {
            defaultTipControl.selectedSegmentIndex = 1;
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onDefaultTipChanged(sender: AnyObject) {
        let defaultTipPercentage = defaultTipControl.selectedSegmentIndex
        
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(defaultTipPercentage, forKey: "defaultTipPercentage")
        defaults.synchronize()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
