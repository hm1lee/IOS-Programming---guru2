//
//  ViewController.swift
//  FireStoreBasic
//
//  Created by Hyemin Lee on 2021/07/30.
//

import UIKit
import FirebaseFirestore

class ViewController: UIViewController, UITextFieldDelegate {

    let database = Firestore.firestore()
    
    
    private let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private let field: UITextField = {
        let field = UITextField()
        field.placeholder = "쪽지 메세지를 입력 후 엔터하세요."
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.black
            .cgColor
        return field
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(label)
        view.addSubview(field)
        field.delegate = self
        
        let docRef = database.document("ios/message")
        docRef.getDocument { snapshot, error in
            guard let data = snapshot?.data(), error == nil else{
                return
            }
            print(data)
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        field.frame = CGRect(x: 10, y: view.safeAreaInsets.top+10, width: view.frame.size.width-20, height: 50)
        label.frame = CGRect(x: 10, y: view.safeAreaInsets.top+10+60, width: view.frame.size.width-20, height: 100)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let text = textField.text, !text.isEmpty {
            SaveData(text: text)
        }
        return true
    }
    
    func SaveData(text: String) {
        let docRef = database.document("ios/message")
        docRef.setData(["text":text])
    }

}

