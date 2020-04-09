//
//  BillBrain.swift
//  Tipsy
//
//  Created by Kaloyan Aleksiev on 10/04/2020.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

struct BillBrain{
    
    private let helper_Dict: [String: Float] = ["0%": 0.0, "10%": 0.1, "20%": 0.2]
    private let dict_Helper: [Float: String] = [0.0: "0%", 0.1: "10%", 0.2: "20%"]
    var tip: Float?
    var split: Int?
    var totalBill: Float?
    var perPerson = "N/A"
    
    func isSelected(percent: String, buttonName: String) -> Bool {
        return percent == buttonName
    }
    
    mutating func setTip(percent: String) {
        self.tip = helper_Dict[percent] ?? 0.0
    }
    
    mutating func getPerPerson() -> String {
        if tip != nil && split != nil && totalBill != nil {
            perPerson = String(format: "%.2f", ((1.0+tip!)*totalBill!)/Float(split!))
            return perPerson
        } else {
            return "N/A"
        }
    }
    
    func getSplit() -> String {
        if let ans=split {
            return String(ans)
        } else {
            return "N/A"
        }
    }
    
    func getPercent() -> String {
        if let ans=tip {
            return dict_Helper[ans] ?? ""
        } else {
            return "N/A"
        }
    }
}
