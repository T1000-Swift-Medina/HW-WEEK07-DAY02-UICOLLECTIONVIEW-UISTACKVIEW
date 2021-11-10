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
        
        if collectionView == CVtop {
            return allBallArr.count
        } else if collectionView == rightCollection  {
            return redArr.count
        } else {
            return blueArr.count
        }
    }
    
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        if collectionView == rightCollection {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "rightID", for: indexPath) as! Top
            cell.titleRight.text = "🔵"

                return cell
        }
        else if collectionView == leftCollection {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "leftID", for: indexPath) as! Top
            
        cell.titleLeft.text = "🔴"

                return cell
                }
        
        else {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "topCell", for: indexPath) as! Top
                if (allBallArr[indexPath.row] == 0) {
                   
                    cell.title.text = " 🔴"
                    return cell

                    
                    
                
                }else if (allBallArr[indexPath.row] == 1) {
                    
                    
                    cell.title.text = " 🔵"
                    return cell
//
                }
                
                cell.title.text = String(allBallArr[indexPath.row])
                return cell
            }
        }
        
        
    
    
    
    
    
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            
            if collectionView == CVtop {
                redArr.append(allBallArr[indexPath.row])
                allBallArr.remove(at: indexPath.row)
            }else {
                
                blueArr.append(allBallArr[indexPath.row])
                allBallArr.remove(at: indexPath.row)
                
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
            
   
            
            for _ in 0 ... 100 {
                allBallArr.append(Int.random(in: 0...1))
            }
        }}


    
