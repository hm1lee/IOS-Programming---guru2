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
        ref.child("users/1122334455/username").setValue(["test":"bbbb","id":"flashmastero","data":11121312])
        
        // 기존 데이터에서 .setValue 다시 하게되면 새로운 값으로 갱신됨 (기존 값 삭제 현상 발견)
        //ref.child("users/1122334455/username").setValue(["test":"aaa"])
        
        // 2. if we want to update data, using '.updateChildValues'
        ref.child("users/1122334455/username").updateChildValues(["test":"aaa"])
        
        
        // 비동기 이벤트 수신 대기
        // 전체 데이터 말고, 하위 데이터만 가져올 수는 없을까?
        // 생성한 ref2를 observe앞에 넣어서 확인해보기
        ref2 = ref.child("users/1122334455")
        
        // DataEventType : 바뀌면 데이터를 다 가져온다.
        refHandle = ref2.observe(DataEventType.value, with: {( snapshot) in
            let postDic = snapshot.value as? [String : AnyObject] ?? [:]
            print(postDic)
        })
        
    }

    @IBAction func pressBtn(_ sender: UIButton) {
        print("button pressed")
        //원할 떄 가져오는 singleEvent
        ref2.observeSingleEvent(of: .value) {(snapshot) in
            let data = snapshot.value as? [String:AnyObject] ?? [:]
            print(data)
        }
    }
    
}

