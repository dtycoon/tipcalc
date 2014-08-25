//
//  UserViewController.swift
//  tipcalc
//
//  Created by Deepak Agarwal on 8/24/14.
//  Copyright (c) 2014 Deepak Agarwal. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        var defaults = NSUserDefaults.standardUserDefaults()
        
        var tip1 = defaults.integerForKey("tip_percertage_1")
        tipField1.text = "\(tip1)"
           var tip2 = defaults.integerForKey("tip_percertage_2")
        tipField2.text = "\(tip2)"

        var tip3 = defaults.integerForKey("tip_percertage_3")
        tipField3.text = "\(tip3)"
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var tipField3: UITextField!
    @IBOutlet weak var tipField2: UITextField!

    @IBOutlet weak var tipField1: UITextField!
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func onTapBack(sender: UIButton) {
    dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func onTap(sender: AnyObject) {
         view.endEditing(true)
    }
    @IBAction func onEditingChanged(sender: AnyObject) {
        var defaults = NSUserDefaults.standardUserDefaults()
    var tip1:Int? = tipField1.text.toInt()
        if (tip1 == nil)
        {
            tip1 = 0
            tipField1.text = "0"
            
        }
        else
        {
            tipField1.text = "\(tip1!)"
        }
    defaults.setInteger(tip1!, forKey: "tip_percertage_1")
        
    var tip2:Int? = tipField2.text.toInt()
        if (tip2 == nil)
        {
            tip2 = 0
            tipField2.text = "0"
            
        }
        else
        {
        tipField2.text = "\(tip2!)"
        }
        defaults.setInteger(tip2!, forKey: "tip_percertage_2")
        
        var tip3:Int? = tipField3.text.toInt()
        if (tip3 == nil)
        {
            tip3 = 0
            tipField3.text = "0"
            
        }
        else
        {
        tipField3.text = "\(tip3!)"
        }
        defaults.setInteger(tip3!, forKey: "tip_percertage_3")
 
    }
}
