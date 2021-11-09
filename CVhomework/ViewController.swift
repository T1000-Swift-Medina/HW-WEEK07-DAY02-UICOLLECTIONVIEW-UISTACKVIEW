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

//      let balls : [String:Int] = ["Blue":0 , "Red":1]
//        let randomBalls = balls.randomElement()

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

