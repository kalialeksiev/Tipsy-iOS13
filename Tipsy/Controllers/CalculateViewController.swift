//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroTipButton: UIButton!
    @IBOutlet weak var tenTipButton: UIButton!
    @IBOutlet weak var twentyTipButton: UIButton!
    
    var billBrain = BillBrain()
    
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    @IBAction func tipChanged(_ sender: UIButton) {
        let percent = sender.currentTitle!
        zeroTipButton.isSelected = billBrain.isSelected(percent: percent, buttonName: zeroTipButton.currentTitle ?? "")
        tenTipButton.isSelected = billBrain.isSelected(percent: percent, buttonName: tenTipButton.currentTitle ?? "")
        twentyTipButton.isSelected = billBrain.isSelected(percent: percent, buttonName: twentyTipButton.currentTitle ?? "")
        billBrain.setTip(percent: percent)
        billTextField.endEditing(true)
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        billBrain.split = Int(sender.value)
        splitNumberLabel.text = String(billBrain.split ?? 0)
    }
    @IBAction func calculatePressed(_ sender: UIButton) {
        billBrain.totalBill = Float(billTextField.text ?? "0")
        let perPerson = billBrain.getPerPerson()
        if perPerson != "N/A" {
            self.performSegue(withIdentifier: "goToResult", sender: CalculateViewController())
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.perPerson = billBrain.getPerPerson()
            destinationVC.split = billBrain.getSplit()
            destinationVC.percent = billBrain.getPercent()
            
        }
        
    }
    
}

