//
//  ViewController.swift
//  Wilks Calculator
//
//  Created by Mike Youngstrom on 5/3/16.
//  Copyright © 2016 youngstromDevelopment. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //arguments to calculate Wilks
    @IBOutlet private weak var poundsOrKilos: UISegmentedControl!
    @IBOutlet private weak var maleOrFemale: UISegmentedControl!
    @IBOutlet private weak var bodyweightText: UITextField!
    @IBOutlet private weak var weightLiftedText: UITextField!
    
    //label to display the resulting Wilks
    @IBOutlet private weak var wilksResult: UILabel!
    
    //calculated value for display
    private var displayValue: Double {
        get {
            return Double(wilksResult.text!)!
        }
        set {
            wilksResult.text = String(newValue)
        }
    }
    
    private var wilksModelInstance: WilksModel = WilksModel()
    
    //method triggered by pressing calculate!
    @IBAction private func calculateButton() {
        
        //get arguments for Wilks from the view
        let unitChoice = poundsOrKilos.selectedSegmentIndex
        let genderChoice = maleOrFemale.selectedSegmentIndex
        
        if let bodyweight = Double(bodyweightText.text!){
            if let weightLifted = Double(weightLiftedText.text!){
                
                //invoke method to calculate wilks, and set display
                wilksModelInstance.calculateWilks(unitChoice, gender: genderChoice, bodyweight: bodyweight, weightLifted: weightLifted)
                
                displayValue = wilksModelInstance.wilksResult
                wilksResult.hidden = false
            }
            else {
                
                let alertController = UIAlertController(title: "Invalid Weight!", message: "Please enter a valid number for Weight Lifted.", preferredStyle: .Alert)
                let cancelAction = UIAlertAction(title: "Return", style: .Cancel){
                    (action) in
                }
                alertController.addAction(cancelAction)
                self.presentViewController(alertController, animated: true){}
            }
        } else {
            
            let alertController = UIAlertController(title: "Invalid Weight!", message: "Please enter a valid bodyweight.", preferredStyle: .Alert)
            let cancelAction = UIAlertAction(title: "Return", style: .Cancel){
                (action) in
            }
            alertController.addAction(cancelAction)
            self.presentViewController(alertController, animated: true){}
        }
        
    }
    
    func dismissKeyboard(){
        view.endEditing(true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let screenPressed: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(screenPressed)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

