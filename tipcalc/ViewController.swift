//
//  ViewController.swift
//  tipcalc
//
//  Created by Deepak Agarwal on 8/24/14.
//  Copyright (c) 2014 Deepak Agarwal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var tipPercentages: [Double] = [0, 0, 0]
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text="$0.00"
        totalLabel.text="$0.00"
        
        
    }
    @IBOutlet weak var tipLabel: UILabel!

    @IBOutlet weak var tipControl: UISegmentedControl!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }

    @IBAction func onEditingChanged(sender: AnyObject) {

        loadTotal()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        println("view will appear")
        loadTipControl()
        loadTotal()

    }
    func loadTipControl()
    {
        var defaults = NSUserDefaults.standardUserDefaults()
        
        var tip1 = defaults.integerForKey("tip_percertage_1")
        tipPercentages[0] = (tip1 as NSNumber).doubleValue / 100
        tipControl.setTitle("\(tip1)%", forSegmentAtIndex: 0)
        
        var tip2 = defaults.integerForKey("tip_percertage_2")
        tipPercentages[1] = (tip2 as NSNumber).doubleValue / 100
        tipControl.setTitle("\(tip2)%", forSegmentAtIndex: 1)
        
        var tip3 = defaults.integerForKey("tip_percertage_3")
        tipPercentages[2] = (tip3 as NSNumber).doubleValue / 100
        tipControl.setTitle("\(tip3)%", forSegmentAtIndex: 2)

    }
    
    func loadTotal()
    {
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        var billAmount = (billField.text as NSString).doubleValue
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)

    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        println("view did appear")
    }
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        println("view will disappear")
    }
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        println("view did disappear")
    }
}

