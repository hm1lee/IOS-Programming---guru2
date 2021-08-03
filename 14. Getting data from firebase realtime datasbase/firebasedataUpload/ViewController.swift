//
//  ViewController.swift
//  firebasedataUpload
//
//  Created by Hyemin Lee on 2021/08/02.
//

import UIKit
import FirebaseDatabase

class ViewController: UIViewController {
    // 개인정보 수정하기 Btn
    @IBOutlet weak var EditBtn: UIButton!

    @IBOutlet weak var data: UITextField!
    
    // 데이터 받아올 Label 정의
    @IBOutlet weak var dataView: UILabel!
    @IBOutlet weak var weightView: UILabel!
    @IBOutlet weak var ageView: UILabel!
    @IBOutlet weak var heightView: UILabel!
    
    // databaseReference
    var ref : DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        // Do any additional setup after loading the view.
        print("에러시점 1")
    }
    

    override func viewWillAppear(_ animated: Bool) {
        self.getDatafromDB()
    }
    
    func getDatafromDB() {
        // username
        self.ref.child("users/test/usersInformation/username").getData { (error, snapshot) in
            if let error = error {
                print("Error getting data \(error)")
            }
            else if snapshot.exists() {
                print("Got data \(snapshot.value!)")
                DispatchQueue.main.async {
                    self.dataView.text = "\(snapshot.value!)"
                }
            }else {
                print("No data available")
            }
        }
        
        self.ref.child("users/test/usersInformation/weight").getData { (error, snapshot) in
            if let error = error {
                print("Error getting data \(error)")
            }
            else if snapshot.exists() {
                print("Got data \(snapshot.value!)")
                DispatchQueue.main.async {
                    self.weightView.text = "\(snapshot.value!)"
                }
            }else {
                print("No data available")
            }
        }
        
        self.ref.child("users/test/usersInformation/height").getData { (error, snapshot) in
            if let error = error {
                print("Error getting data \(error)")
            }
            else if snapshot.exists() {
                print("Got data \(snapshot.value!)")
                DispatchQueue.main.async {
                    self.heightView.text = "\(snapshot.value!)"
                }
            }else {
                print("No data available")
            }
        }
        
        self.ref.child("users/test/usersInformation/ages").getData { (error, snapshot) in
            if let error = error {
                print("Error getting data \(error)")
            }
            else if snapshot.exists() {
                print("Got data \(snapshot.value!)")
                DispatchQueue.main.async {
                    self.ageView.text = "\(snapshot.value!)"
                }
            }else {
                print("No data available")
            }
        }
    }
    
 
}



