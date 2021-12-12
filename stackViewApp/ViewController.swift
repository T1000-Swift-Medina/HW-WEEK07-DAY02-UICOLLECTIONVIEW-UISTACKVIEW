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
    @IBOutlet weak  var redCollection: UICollectionView!
    
    var arrBlue = [Int]()
    var arrRed = [Int]()
    var arrcolor = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        allCollection.delegate = self
        allCollection.dataSource = self
        
        blueCollection.delegate = self
        blueCollection.dataSource = self
        
        redCollection.delegate = self
        redCollection.dataSource = self
        
        
        // 3 arr
        for _ in 0 ... 48 {
            arrcolor.append(Int.random(in: 0...1))
           }
        
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if allCollection == collectionView{
            return arrcolor.count
            
        }
        else if blueCollection == collectionView {
            return arrBlue.count
        }
        else{
            return arrRed.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == allCollection  {
            let cell = allCollection.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath ) as! HomeCell
            cell.title.text = String(arrcolor[indexPath.row])
            return cell
        }
        else if collectionView == blueCollection {
            
            let cell2 = blueCollection.dequeueReusableCell(withReuseIdentifier: "myCell", for:  indexPath ) as! blueCell
            cell2.blueLabel.text = "✅"
            return cell2
        } else {
            let cell3 = redCollection.dequeueReusableCell(withReuseIdentifier: "myCell", for:  indexPath) as! redCell
            if (arrcolor[indexPath.row] == 0) {
                cell3.redCell.text = "❌"
                
            } else if (arrcolor[indexPath.row] == 1 ) {
                //  cell3.redCell.text = String(arrRed[indexPath.row])
               
            }//
            return cell3
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //if(collectionView == allCollection){
        //    if arrcolor[indexPath.row] % 2 == 0 {
        //      arrBlue.append(arrcolor[indexPath.row])
        //     arrcolor.remove(at: indexPath.row)
        //  } else {
        //    arrRed.append(arrcolor[indexPath.row])
        //     arrcolor.remove(at: indexPath.row)
        //  }
        //
        
        if collectionView == blueCollection{
            arrcolor.append(arrBlue[indexPath.row])
            arrBlue.remove(at: indexPath.row)
            
        }else if collectionView == redCollection{
            arrcolor.append(arrRed[indexPath.row])
            arrRed.remove(at: indexPath.row)
            
            
        }else {
            if (arrcolor[indexPath.row] == 1){
                arrBlue.append(arrcolor[indexPath.row])
                arrcolor.remove(at: indexPath.row)
            }
            else {
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
