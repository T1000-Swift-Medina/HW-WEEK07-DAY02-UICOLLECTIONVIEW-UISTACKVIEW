//
//  ViewController.swift
//  stackViewApp
//
//  Created by شروق فرج سويلم الحويطي on 03/04/1443 AH.
//

import UIKit

class ViewController: UIViewController ,UICollectionViewDelegate , UICollectionViewDataSource {
    
    
    @IBOutlet weak var allCollection: UICollectionView!
    @IBOutlet weak var blueCollection: UICollectionView!
    @IBOutlet weak var redCollection: UICollectionView!
    var arrBlue = [Int]()
    var arrRed = [Int]()
    var arrcolor = [1,2,3,4,5,6]
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        allCollection.delegate = self
        allCollection.dataSource = self
        
        blueCollection.delegate = self
        blueCollection.dataSource = self
        
        redCollection.delegate = self
        redCollection.dataSource = self
        
        
        // 3 arr
       
        
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if allCollection == collectionView{
            return arrcolor.count}
        else if blueCollection == collectionView {
            return arrBlue.count
        }
        else{
            return arrRed.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == allCollection {
        let cell = allCollection.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath ) as! HomeCell
        cell.title.text = String(arrcolor[indexPath.row])
        return cell
        }
        else if collectionView == blueCollection{
    
    let cell2 = blueCollection.dequeueReusableCell(withReuseIdentifier: "myCell", for:  indexPath as IndexPath ) as! blueCell
    cell2.blueLabel.text = String(arrBlue[indexPath.row])
    
    return cell2
        }
        else{
            let cell3 = redCollection.dequeueReusableCell(withReuseIdentifier: "myCell", for:  indexPath as IndexPath ) as! redCell
            cell3.redCell.text = String(arrRed[indexPath.row])
            return cell3
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if(collectionView == allCollection){
            if arrcolor[indexPath.row] % 2 == 0 {
                arrBlue.append(arrcolor[indexPath.row])
                arrcolor.remove(at: indexPath.row)
            } else {
                arrRed.append(arrcolor[indexPath.row])
                arrcolor.remove(at: indexPath.row)
            }
        }
        allCollection.reloadData()
        redCollection.reloadData()
        blueCollection.reloadData()
    }
       //else if(collectionView == blueCollection){
            
}
       
    
    





//                } else if blueCollection == collectionView{
//
//                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "blueCell", for: indexPath ) as! HomeCell
//                } else {
//                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "redCell", for: indexPath ) as! HomeCell
//
