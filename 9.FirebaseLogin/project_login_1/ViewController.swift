//
//  ViewController.swift
//  project_login_1
//
//  Created by Hyemin Lee on 2021/07/22.
//

import UIKit
import FirebaseAuthUI
import FirebaseEmailAuthUI

class ViewController: UIViewController, FUIAuthDelegate{
    
    var handle:AuthStateDidChangeListenerHandle!
    let authUI = FUIAuth.defaultAuthUI()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        authUI!.delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
            if let currentUser = auth.currentUser { //지금 로그인한 유저가 있어?
                NSLog("Logged In")
                if let displayName = currentUser.displayName {
                    let alertController = UIAlertController(title: "Welcome", message: "\(displayName)! welcome!", preferredStyle: .alert)
                    // ok부분 추가하여 확인하면 알림창 제거하기
                    alertController.addAction(UIAlertAction(title: "OK ", style: .default, handler: nil))
                    self.present(alertController, animated: false, completion: nil)
                }
            } else { //로그아웃 되거나 아예 로그인 x인 상태
                let providers : [FUIAuthProvider] = [
                    FUIEmailAuth()
                ]
                self.authUI!.providers = providers
                let authVC = self.authUI!.authViewController()
                authVC.modalPresentationStyle = .fullScreen
                self.present(authVC, animated: false, completion: nil)
                
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        Auth.auth().removeStateDidChangeListener(handle!)
    }
    
    
    @IBAction func doSignOut(_ sender: Any) {
        // 현재 유저가 있다면 동작하도록
        do {
            try authUI?.signOut()
        }   catch {
            print("로그아웃 에러")
        }
    }
}
