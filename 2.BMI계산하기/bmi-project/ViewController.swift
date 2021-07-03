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
  
    // 자리수 계산기
    let numberFormatter:NumberFormatter = {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal // = NumberFormatter.Style.decimal
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 3
        return nf
        
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func calculation(_ sender: Any) {
        if let heightText = heightField.text, let height = Double(heightText), let weightText = weightField.text, let weight = Double(weightText) {
            let bmi = weight / ((height/100) * (height/100))
            BmiField.text = numberFormatter.string(from: NSNumber(value: bmi)) //value값은 꼭 double로 해야함
        }
        //calculation을 누르면 키보드 바 사라짐
        weightField.resignFirstResponder()
        heightField.resignFirstResponder()
    
    }
    
    @IBAction func textFieldFinishEdit(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    @IBAction func textEndEditing(_ sender: Any) {
        view.endEditing(true) //현재 View의 editing을 사라지게 하는 것
    }
}

