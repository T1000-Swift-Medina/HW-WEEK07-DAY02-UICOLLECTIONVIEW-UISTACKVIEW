//
//  ViewController.swift
//  homeWStack
//
//  Created by نجود  on 03/04/1443 AH.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate , UICollectionViewDataSource {
    
    var  allBallArr =  [Int]()
    var blueArr =  [Int]()
    var redArr = [Int]()
    
    
    @IBOutlet weak var CVtop: UICollectionView!
    
    @IBOutlet weak var rightCollection: UICollectionView!
    
    @IBOutlet weak var leftCollection: UICollectionView!
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        
        if collectionView == rightCollection  {
           return blueArr.count
       }
         else if collectionView == leftCollection {
            return redArr.count
        }else {
            return allBallArr.count
        }
    }
    
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == rightCollection {
            let cellRight = collectionView.dequeueReusableCell(withReuseIdentifier: "rightID", for: indexPath) as! Top
            
            if (blueArr[indexPath.row] == 0) {
                cellRight.titleRight.text = "🔴"
                return cellRight
            }else {
                cellRight.titleRight.text = "🔵"
            }

            return cellRight
        }
        else if collectionView == leftCollection {
            let cellLeft = collectionView.dequeueReusableCell(withReuseIdentifier: "leftID", for: indexPath) as! Top
            
            if (redArr[indexPath.row] == 0) {
                cellLeft.titleLeft.text = "🔴"
            }else {
                cellLeft.titleLeft.text = "🔵"
            }

            
            
            
            return cellLeft
        }
        
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "topCell", for: indexPath) as! Top
            if (allBallArr[indexPath.row] == 0) {
                cell.title.text = " 🔴"
            }else if (allBallArr[indexPath.row] == 1) {
                cell.title.text = " 🔵"
            }
            return cell
        }
    }
    
    
    
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
          if collectionView == rightCollection{
                blueArr.append(allBallArr[indexPath.row])
                allBallArr.remove(at: indexPath.row)
                
                
            }else if  collectionView == leftCollection{
                
                
                
                redArr.append(allBallArr[indexPath.row])
                allBallArr.remove(at: indexPath.row)
            }
        else  {
            
                 if (allBallArr[indexPath.row] == 1 ){
                blueArr.append(allBallArr[indexPath.row])
                allBallArr.remove(at: indexPath.row)
                
                
                
            }
                 else  {
                redArr.append(allBallArr[indexPath.row])
                allBallArr.remove(at: indexPath.row)
                
                
                
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
            allBallArr.append(Int.random(in: 0...1))
        }
    }
    
}



