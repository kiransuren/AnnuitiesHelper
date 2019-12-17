//
//  ViewController.swift
//  AnnuitiesHelper
//
//  Created by Kiran Surendran on 2/12/18.
//  Copyright © 2018 Quentiam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var result: Double = 0.0
    
    //Outlets
    @IBOutlet weak var futureButton: UIButton!
    @IBOutlet weak var presentButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var rTextField: UITextField!
    @IBOutlet weak var iTextField: UITextField!
    @IBOutlet weak var nTextField: UITextField!
    @IBOutlet weak var cTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        //Change button design to rounded
        futureButton.layer.cornerRadius = 10.0
        presentButton.layer.cornerRadius = 10.0
    }
    

    
    //On Button Pressed
    @IBAction func onButtonPressed(_ sender: AnyObject) {
        
        //Variable  initialization
        guard let rVal = Double(rTextField.text!) else {
            print("Not a number!")
            return
        }
        
        guard let  cVal = Double(cTextField.text!) else{
            print("Not a number!")
            return
        }
        
        guard var iVal = Double(iTextField.text!) else {
            print("Not a number!")
            return
        }
        iVal /= 100
        iVal /= cVal
        
        guard let nVal = Double(nTextField.text!) else {
            print("Not a number!")
            return
        }
        
        
        if(sender.tag == 1){            //IF the button pressed is: FUTURE VALUE
            result = calcFutureValue(r: rVal, i: iVal, n: nVal)
        }else if(sender.tag == 2){      //IF the button pressed is: PRESENT VALUE
            result = calcPresentValue(r: rVal, i: iVal, n: nVal)
        }
        
        resultLabel.text = String(result)
        
    }
    
    
    //Calculate the future value using r,i,n
    func calcFutureValue(r: Double, i: Double, n: Double) -> Double{
        var result = pow((1+i), n)
        result -= 1
        result *= r
        result /= i
        
        return (round(result * 100) / 100)
        //let result = Double((r(pow((1 + i), n) - 1)) / i)
    }
    
    //Calculate the future value using r,i,n
    func calcPresentValue(r: Double, i: Double, n: Double) -> Double{
        var result = pow((1+i),-n)
        result = 1-result
        result *= r
        result /= i
        
        return (round(result * 100) / 100)
        //let result = Double((r(1 - pow((1 + i), -n))) / i)
    }
    
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

