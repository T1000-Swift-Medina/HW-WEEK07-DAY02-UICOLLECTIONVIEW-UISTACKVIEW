//
//  ViewController.swift
//  HWweek7.
//
//  Created by Reem Saleh on 03/04/1443 AH.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    @IBOutlet weak var balls: UICollectionView!
    
    @IBOutlet weak var CollectionBlue: UICollectionView!
    
    @IBOutlet weak var CollectionRed: UICollectionView!
    
    var arrBlueBalls: [Int] = []
    var arrRedBLLS: [Int] = []
    var mainarr: [Int] = []
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == balls {
            
            return mainarr.count
        }else if collectionView == CollectionBlue{
            return arrBlueBalls.count
        }else{
            return arrRedBLLS.count
            
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        if collectionView == balls {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath)as! CollectionViewCell
            if (mainarr[indexPath.row] == 0) {
                cell.title.text = "🔴"
                return cell
            }else {
                cell.title.text = "🔵"
                return cell
            }
        }
        
        if collectionView == CollectionBlue {
            let cellBlue = collectionView.dequeueReusableCell(withReuseIdentifier: "BlueID", for: indexPath)as! CollectionViewCell
            
            cellBlue.blueTitle.text = "🔵"
            return cellBlue
        } else {
            let cellRed = collectionView.dequeueReusableCell(withReuseIdentifier: "RedeID", for: indexPath)as! CollectionViewCell
            cellRed.titleRed.text = "🔴"
            
            return cellRed
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == balls {
            if (mainarr[indexPath.row] == 0 ){
                arrRedBLLS.append(mainarr[indexPath.row])
                mainarr.remove(at: indexPath.row)
            }else{
                arrBlueBalls.append(mainarr[indexPath.row])
                mainarr.remove(at: indexPath.row)
            }
        } else if collectionView == CollectionBlue {
            mainarr.append(arrBlueBalls [indexPath.row])
            arrBlueBalls.remove(at: indexPath.row)
        } else {
            mainarr.append(arrRedBLLS[indexPath.row])
            arrRedBLLS.remove(at: indexPath.row)
            
        }
        
       balls.reloadData()
        CollectionBlue.reloadData()
        CollectionRed.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // mainarr fill 100 balls
        
        balls.delegate = self
        balls.dataSource = self
        CollectionRed.delegate = self
        CollectionRed.dataSource = self
        CollectionBlue.delegate = self
        CollectionBlue.delegate = self

        for _ in 0...50 {
            let rand = Int.random(in: 0...1)
            mainarr.append(rand)
        }
    }
}
