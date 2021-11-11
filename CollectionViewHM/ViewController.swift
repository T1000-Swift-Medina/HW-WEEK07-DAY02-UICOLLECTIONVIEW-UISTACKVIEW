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
            if (arrMixedBall[indexPath.row] == 0){
                //                cell.CellNum.backgroundColor = red
                cell.CellNum.text = "❤️"
            } else {
                cell.CellNum.text = "💙"
            }
            return cell
        } else if BlueCV == collectionView {
            let blue = collectionView.dequeueReusableCell(withReuseIdentifier: "BlueCell", for: indexPath) as! CustomCell
            blue.blueHeart.text = "💙"
            return blue
        } else {
            let red = collectionView.dequeueReusableCell(withReuseIdentifier: "RedCell", for: indexPath) as! CustomCell
            red.RedHeart.text = "❤️"
            return red
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == cvMain {
            if (arrMixedBall[indexPath.row] == 0) {
                arrMixedBall.remove(at: indexPath.row)
                arrRed.append(arrMixedBall[indexPath.row])
            }else {
                arrMixedBall.remove(at: indexPath.row)
                arrBlue.append(arrMixedBall[indexPath.row])
            }
        }
        else if collectionView == RedCV {
            arrMixedBall.append(arrRed[indexPath.row])
            arrRed.remove(at: indexPath.row)
        } else {
            arrMixedBall.append(arrBlue[indexPath.row])
            arrBlue.remove(at: indexPath.row)
        }
        
        cvMain.reloadData()
        BlueCV.reloadData()
        RedCV.reloadData()
        
        
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for _ in 0...50 {
            arrMixedBall.append(Int.random(in: 0...1))
        }
        // Do any additional setup after loading the view.
        cvMain.delegate = self
        cvMain.dataSource = self
        BlueCV.delegate = self
        BlueCV.dataSource = self
        RedCV.delegate = self
        RedCV.dataSource = self
    }
    
    
}

