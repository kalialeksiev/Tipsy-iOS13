//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Kaloyan Aleksiev on 10/04/2020.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var perPerson: String?
    var percent: String?
    var split: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = perPerson
        settingsLabel.text = "Split between \(split ?? "") people with \(percent ?? "") tip."

    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
