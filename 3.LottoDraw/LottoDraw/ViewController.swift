//
//  ViewController.swift
//  LottoDraw
//
//  Created by Hyemin Lee on 2021/07/05.
//

import UIKit
import FMDB

class ViewController: UIViewController {
    //변수 형태 var 사용 (배열의 배열은 정수로 구성하겠다)
    var lottoNumbers = Array<Array<Int>>()
    
    @IBOutlet weak var TableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func DoLoad(_ sender: Any) {
        print("DoLoad")
    }
    @IBAction func DoDraw(_ sender: Any) {
        lottoNumbers = Array<Array<Int>>()
        
        var originalNumbers = Array(1...45)
        var index = 0
        // 5번 반복하겠다
        for _ in 0...4 {
            var originalNumbers = Array(1...45)
            var columnArray = Array<Int>()
            for _ in 0...5 {
                index = Int.random(in: 0..<originalNumbers.count)
                columnArray.append(originalNumbers[index])
                originalNumbers.remove(at: index) //사용한 숫자를 지우자
            }
            columnArray.sort() // 뽑은 숫자를 정렬한다.
            lottoNumbers.append(columnArray) // 한텀 뽑은 숫자를 큰 배열에 넣기
        }
        self.TableView.reloadData()
    }
    @IBAction func DoSave(_ sender: Any) {
        print("DoSave")
    }
}

// extension 안에 변수 설정 불가 / 메서드만 넣을 수 있음
extension ViewController:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 셀이 몇개냐에 대한 부분
        return self.lottoNumbers.count //lottoNumbers만큼의 개수를 리턴
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
        // 셀에 내용을 넣어서 반환함 (as! 를 이용해서 커스텀한 내용을 cell에 넣기)
        let cell = tableView.dequeueReusableCell(withIdentifier: "lottoCell", for: indexPath) as! LottoCell
        
        let numbers = self.lottoNumbers[indexPath.row]
        cell.lable01.text = "\(numbers[0])"
        cell.lable02.text = "\(numbers[1])"
        cell.lable03.text = "\(numbers[2])"
        cell.lable04.text = "\(numbers[3])"
        cell.lable05.text = "\(numbers[4])"
        cell.lable06.text = "\(numbers[5])"
        
        return cell
    }
    
    
}

