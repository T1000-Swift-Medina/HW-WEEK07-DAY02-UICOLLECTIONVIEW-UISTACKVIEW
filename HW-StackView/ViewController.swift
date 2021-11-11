//
//  ViewController.swift
//  HW-StackView
//
//  Created by Yousef Alasmar on 03/04/1443 AH.
//

import UIKit

class ViewController: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource {
    
    var mainArray : [Int] = []
    var blueArray : [Int] = []
    var redArray : [Int] = []
    
    @IBOutlet weak var collectionOne: UICollectionView!
    @IBOutlet weak var redCollection: UICollectionView!
    @IBOutlet weak var blueCollection: UICollectionView!
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionOne == collectionView {
            
            return mainArray.count
        } else if redCollection == collectionView{
            return redArray.count
        } else {
            return blueArray.count
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if (collectionOne == collectionView) {
            let cell = collectionOne.dequeueReusableCell(withReuseIdentifier: "cellOne", for: indexPath) as! CellOne
            cell.cellLbl.text = String(mainArray[indexPath.row])
            
            return cell
        } else if (blueCollection == collectionView) {
            let cell = blueCollection.dequeueReusableCell(withReuseIdentifier: "cellBlueID", for: indexPath) as! CellThree
            
            let cred = blueArray[indexPath.row]
            cell.cellLabel3.text = String(cred)
            
            return cell
        } else {
            let cell = redCollection.dequeueReusableCell(withReuseIdentifier: "cellRedID", for: indexPath) as! CellTwo
            let cred = redArray[indexPath.row]
            cell.cellLabel2.text = String(cred)
            
            return cell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if (collectionView == collectionOne) {
            let tappedNumber = mainArray[indexPath.row]
            if tappedNumber % 2 == 0 {
                redArray.append(tappedNumber)
                mainArray.remove(at: indexPath.row)
            } else {
                blueArray.append(tappedNumber)
                mainArray.remove(at: indexPath.row)
            }
        } else if (collectionView == redCollection) {
            mainArray.append(redArray[indexPath.row])
            redArray.remove(at: indexPath.row)
            
        } else if (collectionView == blueCollection) {
            mainArray.append(blueArray[indexPath.row])
            blueArray.remove(at: indexPath.row)
        }
        
        redCollection.reloadData()
        blueCollection.reloadData()
        collectionOne.reloadData()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionOne.dataSource = self
        collectionOne.delegate = self
        blueCollection.dataSource = self
        blueCollection.delegate = self
        redCollection.dataSource = self
        redCollection.delegate = self
        
        for i in 0..<100 {
            mainArray.append(i)
        }
    }
    
}

class CellOne : UICollectionViewCell {
    
    @IBOutlet weak var cellLbl: UILabel!
    
}

class CellTwo : UICollectionViewCell {
    
    
    @IBOutlet weak var cellLabel2: UILabel!
}

class CellThree : UICollectionViewCell {
    
    @IBOutlet weak var cellLabel3: UILabel!
}
