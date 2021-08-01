//
//  ViewController.swift
//  RealtimeDataBase
//
//  Created by Hyemin Lee on 2021/07/29.
//

import UIKit
import FirebaseDatabase // 꼭 해줘야 한다.

class ViewController: UIViewController {

    var ref : DatabaseReference!
    var refHandle : DatabaseHandle!
    var ref2 : DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 데이터 베이스 연결
        ref = Database.database().reference()
        // 경로 설정해서 어떤 데이터 넣을지 결정하기
        // 로그인 상태라면 user.uid 가 필요함
        
        // 1. if we want to input new data, using '.setValue'
        ref.child("users/1122334455/username").setValue(["test":"bbbb","id":"flashmastero","date":11121312]) {
            // 완료 블록 추가 (커밋된 시점을 확인하기 위해서)
            (error:Error?, ref:DatabaseReference) in
              if let error = error {
                // 성공하면 알림창 추가
                let alertVC = UIAlertController(title: "Error", message: "Data Don't Saved", preferredStyle: .alert)
                
                alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                self.present(alertVC, animated: true, completion: nil)
                print("Data could not be saved: \(error).")
              } else {
                // 성공하면 알림창 추가
                let alertVC = UIAlertController(title: "Complete", message: "Data Saved", preferredStyle: .alert)
                
                alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                self.present(alertVC, animated: true, completion: nil)
              }
        }
        
        // 기존 데이터에서 .setValue 다시 하게되면 새로운 값으로 갱신됨 (기존 값 삭제 현상 발견)
        //ref.child("users/1122334455/username").setValue(["test":"aaa"])
        
        // 2. if we want to update data, using '.updateChildValues'
        ref.child("users/1122334455/username").updateChildValues(["test":"aaa"])
        
        
        // 비동기 이벤트 수신 대기
        // 전체 데이터 말고, 하위 데이터만 가져올 수는 없을까?
        // 생성한 ref2를 observe앞에 넣어서 확인해보기
        ref2 = ref.child("users/1122334455")
        
        
    }
    // 화면이 나타나기 직전에 관찰자를 설정한다.
    override func viewWillAppear(_ animated: Bool) {
        // DataEventType : 바뀌면 데이터를 다 가져온다
        print("옵저버 등록")
        refHandle = ref2.observe(DataEventType.value, with: {( snapshot) in
            let postDic = snapshot.value as? [String : AnyObject] ?? [:]
            print(postDic)
        })
    }
    
    // 화면이 사라지고 나면 옵저버를 삭제한다.
    override func viewWillDisappear(_ animated: Bool) {
        print("옵저버 삭제")
        ref.removeObserver(withHandle: refHandle)
    }

    @IBAction func pressBtn(_ sender: UIButton) {
        print("button pressed")
        //원할 떄 가져오는 singleEvent
        ref2.observeSingleEvent(of: .value) {(snapshot) in
            let data = snapshot.value as? [String:AnyObject] ?? [:]
            print(data)
        }
    }
    
    // 데이터 삭제
    @IBAction func removeBtn(_ sender: UIButton) {
        print("remove pressed")
        ref.child("users/1122334455/username").child("date").removeValue(){
            (error:Error?, ref:DatabaseReference) in
              if let error = error {
                // 성공하면 알림창 추가
                let alertVC = UIAlertController(title: "Error", message: "Data Don't Saved", preferredStyle: .alert)
                
                alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                self.present(alertVC, animated: true, completion: nil)
                print("Data could not be saved: \(error).")
              } else {
                // 성공하면 알림창 추가
                let alertVC = UIAlertController(title: "Data removed", message: "Data Saved", preferredStyle: .alert)
                
                alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                self.present(alertVC, animated: true, completion: nil)
              }
        }
        
    }
    
}

