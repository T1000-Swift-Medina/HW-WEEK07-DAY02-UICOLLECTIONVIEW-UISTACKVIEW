//
//  ViewController.swift
//  HW-HW-Week7-Day2-CollectionView-StackView Week7-Day2-CollectionView-StackView
//
//  Created by بندر عبيد ثاري الرشيدي on 03/04/1443 AH.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var CollectionView11: UICollectionView!
    
    @IBOutlet weak var CollectionRed: UICollectionView!
    
    @IBOutlet weak var CollectionBlue: UICollectionView!

    var arryBool = [String] ()
    var arryTrue : [String] = []
    var arryFolse: [String] = []
   
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (collectionView == CollectionView11){
              return arryBool.count
            }else if (collectionView == CollectionRed ){
                return arryFolse.count
            } else  {
                return arryTrue.count
            }}
          
    override func viewDidLoad() {
           super.viewDidLoad()
           CollectionView11.delegate = self
           CollectionView11.dataSource = self
        CollectionBlue.delegate = self
        CollectionBlue.dataSource = self
        CollectionRed.delegate = self
        CollectionRed.dataSource = self
        
        for B in 1...28{
            arryBool.append(String(B))
        }
        
        CollectionBlue.register(myCellBlue.self, forCellWithReuseIdentifier: "cellID2")
           CollectionRed.register(myCellRed.self, forCellWithReuseIdentifier: "cellID3")
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
//              cell3.layer.cornerRadius = 22
              return cell3
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID1", for: indexPath) as! CollectionViewCell
            if indexPath.row % 2 == 0 {
                cell.backgroundColor = .cyan
//                cell.layer.cornerRadius = 22
                cell.label1.text = "✅"}
            else  {
                cell.backgroundColor = .link
                      cell.layer.cornerRadius = 22
                cell.label1.text = "❌"
            }
            return cell
            
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
        if collectionView == CollectionView11 {
            let cell4 = CollectionView11.cellForItem(at: indexPath)as!CollectionViewCell
            if cell4.label1.text == "✅" {
                arryTrue.append(String(indexPath.row))
                arryBool.remove(at: indexPath.row )
                       CollectionView11.deleteItems(at: [indexPath])
                       CollectionBlue.reloadData()
                       CollectionView11.reloadData()
            }
            else if cell4.label1.text == "❌" {
                arryFolse.append(String(indexPath.row))
                arryBool.remove(at: indexPath.row )
                CollectionView11.deleteItems(at: [indexPath])
                CollectionRed.reloadData()
                CollectionView11.reloadData()
            }
        }
        if collectionView == CollectionRed {
            let cell4 = CollectionView11.cellForItem(at: indexPath)as!CollectionViewCell
            if cell4.label1.text == "✅" {
                arryTrue.remove(at: indexPath.row )
                arryBool.append(String(indexPath.row))
                       CollectionView11.deleteItems(at: [indexPath])
                       CollectionBlue.reloadData()
                       CollectionView11.reloadData()
            }
    }
        if collectionView == CollectionBlue {
        let cell4 = CollectionView11.cellForItem(at: indexPath)as!CollectionViewCell
        if cell4.label1.text == "❌" {
            arryFolse.remove(at: indexPath.row )
            arryBool.append(String(indexPath.row))
                   CollectionView11.deleteItems(at: [indexPath])
                   CollectionBlue.reloadData()
                   CollectionView11.reloadData()
        }
        }}}
class myCellBlue : UICollectionViewCell {
    @IBOutlet weak var label2: UILabel!
    
}
class myCellRed : UICollectionViewCell {
    
    @IBOutlet weak var label3: UILabel!
}


