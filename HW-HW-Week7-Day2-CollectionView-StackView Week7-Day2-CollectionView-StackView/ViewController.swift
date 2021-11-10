//
//  ViewController.swift
//  HW-HW-Week7-Day2-CollectionView-StackView Week7-Day2-CollectionView-StackView
//
//  Created by بندر عبيد ثاري الرشيدي on 03/04/1443 AH.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
   
    
    @IBOutlet weak var CollectionViewOne: UICollectionView!
    
    @IBOutlet weak var CollectionRed: UICollectionView!
    
    @IBOutlet weak var CollectionBlue: UICollectionView!
    
    var arryBool = ["✅","❌","✅","❌","✅","❌","✅","❌","✅","❌","✅","❌","✅","❌","✅","❌","✅","❌","✅","❌","✅","❌","✅","❌","✅","❌","✅","❌","✅","❌","✅","❌","✅","❌","✅","❌","✅","❌","✅","❌","✅","❌","✅","❌"]
    var arryTrue : [String] = []
    var arryFolse: [String] = []
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (collectionView == CollectionViewOne){
            return arryBool.count
        }else if (collectionView == CollectionRed ){
            return arryTrue.count
        } else  {
            return arryFolse.count
        }}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CollectionViewOne.delegate = self
        CollectionViewOne.dataSource = self
        CollectionBlue.delegate = self
        CollectionBlue.dataSource = self
        CollectionRed.delegate = self
        CollectionRed.dataSource = self
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if (collectionView == CollectionRed){
            let cell2 = CollectionRed.dequeueReusableCell(withReuseIdentifier: "cellID3", for: indexPath) as! myCellRed
            cell2.backgroundColor = .link
            cell2.layer.cornerRadius = 22
            return cell2
        }
        else if (collectionView == CollectionBlue){
            let cell3 = CollectionBlue.dequeueReusableCell(withReuseIdentifier: "cellID2", for: indexPath) as! myCellBlue
            cell3.backgroundColor = .cyan
            return cell3
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID1", for: indexPath) as! CollectionViewCell
            if arryBool[indexPath.row] == "✅" {
                cell.backgroundColor = .cyan
                cell.label1.text = "✅"}
            else if arryBool[indexPath.row] == "❌" {
                cell.backgroundColor = .link
                cell.layer.cornerRadius = 22
                cell.label1.text = "❌"
            }
            return cell
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        print(indexPath.row)
        
        if collectionView == CollectionViewOne {
            let cell4 = CollectionViewOne.cellForItem(at: indexPath)as!CollectionViewCell
            if cell4.label1.text == "❌" {
                arryTrue.append("✅")
                arryBool.remove(at: indexPath.row )
                CollectionViewOne.reloadData()
                CollectionRed.reloadData()
      
            } else {
                arryFolse.append("❌")
                arryBool.remove(at: indexPath.row )
                CollectionViewOne.reloadData()
                CollectionBlue.reloadData()
            }}
            
         if collectionView == CollectionRed {
       
            arryBool.append("❌")
            
            CollectionViewOne.reloadData()
            CollectionRed.reloadData()
             arryTrue.remove(at: indexPath.row )
       
        } else if collectionView == CollectionBlue {
            arryBool.append("✅")
            
            CollectionViewOne.reloadData()
            CollectionBlue.reloadData()
            arryFolse.remove(at: indexPath.row )
        }
}
}


class myCellBlue : UICollectionViewCell {
    @IBOutlet weak var label2: UILabel!
    
}
class myCellRed : UICollectionViewCell {
    
    @IBOutlet weak var label3: UILabel!
}



