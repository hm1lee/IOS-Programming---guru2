//
//  ViewController.swift
//  guruproject
//
//  Created by Hyemin Lee on 2021/06/29.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lable1: UITextField!
    @IBOutlet weak var lable2: UITextField!
    
    let numberFormatter:NumberFormatter = {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 2
        return nf
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("앱 화면이 나타납니다.")
    }
    
    @IBAction func doConvert(_ sender: UIButton) {
        if let value1 = lable1.text, let number1 = Double(value1){
            // value * 1.8 + 32 = 화씨
            let fahrenheit = number1 * 1.8 + 32
            lable2.text = numberFormatter.string(from: NSNumber(value: fahrenheit))
            lable1.resignFirstResponder() //키보드가 필요없는 상태임을 인지
        }
        print("버튼이 눌렸습니다.")
    }


    @IBAction func dissmisskeyboard(_ sender: Any) {
        lable1.resignFirstResponder()
        lable2.resignFirstResponder()
    }
}

