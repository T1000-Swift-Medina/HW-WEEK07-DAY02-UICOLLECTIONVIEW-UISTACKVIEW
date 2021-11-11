//
//  ViewController.swift
//  CollectionViewHM
//
//  Created by Razan on 04/04/1443 AH.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var cvMain: UICollectionView!
    
    @IBOutlet weak var BlueCV: UICollectionView!
    
    @IBOutlet weak var RedCV: UICollectionView!
    
    
    var arrMixedBall: [Int] = []
    var arrBlue: [Int] = []
    var arrRed: [Int] = []
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == BlueCV {
            return arrBlue.count
        } else if collectionView == RedCV {
            return arrRed.count
        } else {
            return arrMixedBall.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == cvMain {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainCell", for: indexPath) as! CustomCell
            
//            if (arrRed[indexPath.row] == 0){
//                cell.layer.backgroundColor.black.cgColor
//                cell.layer.cornerRadius = cell.frame.height/2
//                return arrRed.count
//            }
            if (arrRed[indexPath.row] == 0){
//                cell.CellNum.backgroundColor = red
                cell.CellNum.text = "❤️"
            } else if (arrBlue[indexPath.row] == 1) {
                cell.CellNum.text = "💙"
            }
            return cell
        } else if BlueCV == collectionView {
            let blue = collectionView.dequeueReusableCell(withReuseIdentifier: "BlueCell", for: indexPath) as! CustomCell
            
        }
    
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }


}

