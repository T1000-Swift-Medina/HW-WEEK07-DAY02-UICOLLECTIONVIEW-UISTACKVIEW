//
//  ViewController.swift
//  homeWStack
//
//  Created by نجود  on 03/04/1443 AH.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate , UICollectionViewDataSource {
    
    var  allCheckArr =  [Int]()
    var rightArr =  [Int]()
    var falseArr = [Int]()
    
    
    @IBOutlet weak var CVtop: UICollectionView!
    
    @IBOutlet weak var rightCollection: UICollectionView!
    
    @IBOutlet weak var leftCollection: UICollectionView!
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        
        if collectionView == rightCollection  {
           return rightArr.count
       }
         else if collectionView == leftCollection {
            return falseArr.count
        }else {
            return allCheckArr.count
        }
    }
    
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == rightCollection {
            let cellRight = collectionView.dequeueReusableCell(withReuseIdentifier: "rightID", for: indexPath) as! Top
            
//            if (blueArr[indexPath.row] == 0) {
//                cellRight.titleRight.text = "🔴"
//                return cellRight
//            }else {
                cellRight.titleRight.text = "✅"
//            }
//
            return cellRight
        }
        else if collectionView == leftCollection {
            let cellLeft = collectionView.dequeueReusableCell(withReuseIdentifier: "leftID", for: indexPath) as! Top
            
//            if (redArr[indexPath.row] == 0) {
                cellLeft.titleLeft.text = "❌"
//            }else {
//                cellLeft.titleLeft.text = "🔵"
//            }

            
            
        
            return cellLeft
        }
        
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "topCell", for: indexPath) as! Top
            if (allCheckArr[indexPath.row] == 0) {
                cell.title.text = " ❌"
                return cell
            }else if (allCheckArr[indexPath.row] == 1) {
                cell.title.text = " ✅"
                
                return cell
            }
            return cell
        }
    }
    
    
    
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
          if collectionView == rightCollection{
              
                rightArr.append(allCheckArr[indexPath.row])
                allCheckArr.remove(at: indexPath.row)
                
                
            }else if  collectionView == leftCollection{
            
                falseArr.append(allCheckArr[indexPath.row])
                allCheckArr.remove(at: indexPath.row)
            }
        else  {
            
                 if (allCheckArr[indexPath.row] == 1 ){
                     
                     
                rightArr.append(allCheckArr[indexPath.row])
                allCheckArr.remove(at: indexPath.row)
                
                
                
            }
                 else  {
                falseArr.append(allCheckArr[indexPath.row])
                allCheckArr.remove(at: indexPath.row)
             
            }
            
        }
        
        
        CVtop.reloadData()
        rightCollection.reloadData()
        leftCollection.reloadData()
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        CVtop.delegate = self
        CVtop.dataSource = self
        rightCollection.delegate = self
        rightCollection.dataSource = self
        leftCollection.delegate = self
        leftCollection.dataSource = self
        
        
        
        for _ in 0 ... 48 {
            allCheckArr.append(Int.random(in: 0...1))
        }
    }
    
}



