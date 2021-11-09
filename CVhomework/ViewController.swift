//
//  ViewController.swift
//  CVhomework
//
//  Created by Nojoud Mohaimmed on 04/04/1443 AH.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mainCell", for: indexPath)as! mainCollectionCell
///       var dict:[String:Int] = ["A":123, "B": 234, "C": 345]
//        let index: Int = Int(arc4random_uniform(UInt32(dict.count)))
//        let randomVal = Array(dict.values)[index] # 123 or 234 or 345
//        var dic: [String:Int] = ["Blue":0 , "Red":1]
//        let index: Int = Int(arc4random_uniform(UInt32(dic.count)))
//        let randomValue = Array(dic.values)[index]
        let mainBall = Int.random(in: 0...1)
        var arrayBlue : [Int] = []
        var arrayRed : [Int] = []
        if (mainBall == 0){
        cell.firstCell.text = "🔴"
            arrayRed.append(indexPath.row)
        }else{
            cell.firstCell.text = "🔵"
            arrayBlue.append(indexPath.row)
        }
        return cell
    }
    

    @IBOutlet weak var mainCV: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        mainCV.delegate = self
        mainCV.dataSource = self
        
    }


}

