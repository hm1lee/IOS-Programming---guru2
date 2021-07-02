//
//  ViewController.swift
//  bmi-project
//
//  Created by Hyemin Lee on 2021/07/02.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var weightField: UITextField!
    @IBOutlet weak var heightField: UITextField!
    @IBOutlet weak var BmiField: UITextField!
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func calculation(_ sender: Any) {
        if let heightText = heightField.text, let height = Double(heightText), let weightText = weightField.text {
            let bmi = 111
            BmiField.text = "\(bmi)"
            
        }
    
    }
    
}

