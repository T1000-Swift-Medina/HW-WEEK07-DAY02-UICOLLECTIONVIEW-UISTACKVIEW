//
//  ViewController.swift
//  stackViewDemo
//
//  Created by khalid ali on 02/04/1443 AH.
//

import UIKit



class ViewController: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource {
    
    
    @IBOutlet weak var mineCV: UICollectionView!
    @IBOutlet weak var blueCollection: UICollectionView!
    @IBOutlet weak var redCollection: UICollectionView!
    
    
    var originalArray = ["🔴","🔵","🔴","🔵","🔴","🔵","🔴","🔵","🔴","🔵","🔴","🔵","🔴","🔵","🔴","🔵","🔴","🔵","🔴","🔵","🔴","🔵","🔴","🔵","🔴","🔵","🔴","🔵","🔴","🔵","🔴","🔵"]
    
    var blueArray = [String]()
    var redArray = [String]()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if  collectionView == mineCV {
            return originalArray.count
        } else if collectionView == blueCollection {
            return blueArray.count
        } else {
            return redArray.count
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if  collectionView == mineCV {
            let cell1 = collectionView.dequeueReusableCell(withReuseIdentifier: "mycellID", for: indexPath) as! Mycell
            
            cell1.title.text = originalArray[indexPath.row]
            return cell1
            
        } else if collectionView == blueCollection {
            
            let cell2 = blueCollection.dequeueReusableCell(withReuseIdentifier: "CellBlue", for: indexPath ) as! BlueCollectionViewCell
            cell2.label2.text = "🔵"
            return cell2
            
        } else {
            let cell3 = collectionView.dequeueReusableCell(withReuseIdentifier: "CellRed", for: indexPath ) as! RedCollectionViewCell
            cell3.label3.text = "🔴"
            return cell3
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == mineCV  {
            let cell = mineCV.cellForItem(at: indexPath) as! Mycell
           
            
            if cell.title.text == "🔵" {
                blueArray.append(String(indexPath.row))
                originalArray.remove(at: indexPath.row)
                mineCV.reloadData()
                blueCollection.reloadData()
                print(blueArray)
            } else  {
                    redArray.append(String(indexPath.row))
                    originalArray.remove(at: indexPath.row)
                    mineCV.reloadData()
                    redCollection.reloadData()
            }
            
        }
        if collectionView == blueCollection {
                blueArray.remove(at: indexPath.row)
                originalArray.append("🔵")
                blueCollection.reloadData()
                mineCV.reloadData()
            } else if collectionView == redCollection {
                redArray.remove(at:  indexPath.row)
                originalArray.append("🔴")
                redCollection.reloadData()
                mineCV.reloadData()
            } else {
                print("logic check")
            }
            
                
            }
            
        


    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        mineCV.delegate = self
        mineCV.dataSource = self
        blueCollection.delegate = self
        blueCollection.dataSource = self
        redCollection.delegate = self
        redCollection.dataSource = self
    }
    
    
}

//originalarray.remove(at: indexPath.row)
//cvMain.deleteItems(at: [indexPath])
//cvMain.reloadData()
