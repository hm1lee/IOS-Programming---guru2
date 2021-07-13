//
//  ViewController.swift
//  8.NaverWebtoonExample
//
//  Created by Hyemin Lee on 2021/07/11.
//

import UIKit

class ViewController: UIViewController {
   
    var webtoondata =  [
        WebToonData("바른연애 길잡이", "item_01", 4.45, "남수"),
        WebToonData("윈드브레이커", "item_02", 4.93, "조용석"),
        WebToonData("독립일기", "item_03", 4.78, "자까"),
        WebToonData("소녀의 세계", "item_04", 4.69, "모랑지"),
        WebToonData("연애혁명", "item_05", 4.92, "232"),
        WebToonData("신의탑", "item_06", 4.97, "SIU"),
        WebToonData("호랑이형님", "item_07", 4.48, "이상규"),
        WebToonData("프리드로우", "item_08", 4.79, "전선욱"),
        WebToonData("모죠의 일지", "item_09", 4.62, "모죠"),
        WebToonData("취사병 전설이 되다", "item_10", 4.37, "제이로빈/이진수"),
        WebToonData("광장", "item_11", 4.22, "오세형/김균태"),
        WebToonData("나나의 마법서랍 ", "item_12", 4.93, "랑또")
        
        
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return webtoondata.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "webToonCell", for: indexPath) as! WebToonCell
        // title, 별점, 작가명 채우기
        let data = webtoondata[indexPath.row]
        cell.titleLabel.text = data.title
        cell.ratingLabel.text = "\(data.rating!)"
        cell.authorLabel.text = data.author
        cell.titleimage.image = UIImage(named: data.title_image)
        
        // 보더의 간격 및 색 설정
        cell.layer.borderWidth = 0.3
        cell.layer.borderColor = UIColor.lightGray.cgColor
        return cell
    }
    
    
}

extension ViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = self.view.frame.size.width / 3
        let height = width * 1.5
        return CGSize(width: width, height: height)
    }
}
