//
//  ViewController.swift
//  stackViewDemo
//
//  Created by khalid ali on 02/04/1443 AH.
//

import UIKit



class ViewController: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource {
    
    
    @IBOutlet weak var cvMain: UICollectionView!
    @IBOutlet weak var blueCollection: UICollectionView!
    @IBOutlet weak var redCollection: UICollectionView!
    
    
    var originalarray = ["🔴","🔵","🔴","🔵","🔴","🔵","🔴","🔵","🔴","🔵","🔴","🔵","🔴","🔵","🔴","🔵","🔴","🔵","🔴","🔵","🔴","🔵","🔴","🔵","🔴","🔵","🔴","🔵","🔴","🔵","🔴","🔵"]
    
    var bluearray = [String]()
    var redarray = [String]()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if  collectionView == cvMain {
            return originalarray.count
        } else if collectionView == blueCollection {
            return bluearray.count
        } else {
            return redarray.count
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if  collectionView == cvMain {
            let cell1 = collectionView.dequeueReusableCell(withReuseIdentifier: "mycellID", for: indexPath) as! Mycell
            
            cell1.title.text = originalarray[indexPath.row]
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
        if collectionView == cvMain  {
            let cell = cvMain.cellForItem(at: indexPath) as! Mycell
            
            if cell.title.text == "🔵" {
                bluearray.append(String(indexPath.row))
                originalarray.remove(at: indexPath.row)
                cvMain.reloadData()
                blueCollection.reloadData()
                print(bluearray)
            } else {
                    redarray.append(String(indexPath.row))
                    originalarray.remove(at: indexPath.row)
                    cvMain.reloadData()
                    redCollection.reloadData()
                }
                
                
            }
            
        }

        
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        cvMain.delegate = self
        cvMain.dataSource = self
        blueCollection.delegate = self
        blueCollection.dataSource = self
        redCollection.delegate = self
        redCollection.dataSource = self
    }
    
    
}

//originalarray.remove(at: indexPath.row)
//cvMain.deleteItems(at: [indexPath])
//cvMain.reloadData()
