//
//  ViewController.swift
//  4. TableViewExample
//
//  Created by Hyemin Lee on 2021/07/09.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //tableview랑 IBOutlet을 연결해줌
    @IBOutlet weak var tableView: UITableView!
    

    var datasource = [1,2,3,4,5]
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasource.count //줄의 개수를 작성
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let row = indexPath.row// UITableViewCell을 호출해서 상수로 지정
        cell.textLabel?.text = "\(datasource[row])" // cell의 값을 1로 지정해본다.
        return cell
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }
    
    // 들여쓰기 삭제
    func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let fromRow = sourceIndexPath.row
        let toRow = destinationIndexPath.row
        let data = datasource[fromRow]
        datasource.remove(at: fromRow)
        datasource.insert(data, at: toRow)
        
        tableView.reloadData()
    }
    
    
    
    // delegate : 일반적으로 삭제할 때 버튼
    // 셀 오른쪽 끝에 나타날 버튼들
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let btnDelete = UIContextualAction(style: .destructive, title: "Del") {(action, view, complition) in
           
            // 삭제할 데이터 지정
            let row = indexPath.row
            self.datasource.remove(at: row)
            // 데이터 삭제 기능
            tableView.deleteRows(at: [indexPath], with: .fade)
            complition (true)
        }
        // del 버튼을 검정색으로 설정
        btnDelete.backgroundColor = .black
        
        return UISwipeActionsConfiguration(actions: [btnDelete])
    }
    
    // 셀 왼쪽에서 시작할 버튼들
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let btnShare = UIContextualAction(style: .normal, title: "Share") { (action, view, completion) in completion(true)
        }
        return UISwipeActionsConfiguration(actions: [btnShare])
    }
   

    override func viewDidLoad() {
        // view 인스턴스가 메모리에 올라왔고, 화면은 뜨지 않은 상황
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tableView.isEditing = true
    }


}

