//
//  ViewController.swift
//  HW-HW-Week7-Day2-CollectionView-StackView Week7-Day2-CollectionView-StackView
//
//  Created by بندر عبيد ثاري الرشيدي on 03/04/1443 AH.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var CollectionView11: UICollectionView!
    
    @IBOutlet weak var collectionRed: UICollectionView!
    
    @IBOutlet weak var collectionBlue: UICollectionView!

    var arrture = [String] ()
    var arryfolse: [String] = []
    var arrbool : [String] = []
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (collectionView == CollectionView11){
              return arrture.count
            }else if (collectionView == collectionRed ){
                return arryfolse.count
            } else if collectionView == collectionBlue {
                return arrbool.count
            }
            return 0
          }
    override func viewDidLoad() {
           super.viewDidLoad()
   
           CollectionView11.delegate = self
           CollectionView11.dataSource = self
        collectionBlue.delegate = self
        collectionBlue.dataSource = self
        collectionRed.delegate = self
        collectionRed.dataSource = self
        for n in 1...50{
            arrture.append(String(n))
        }
        collectionBlue.register(myCellBlue.self, forCellWithReuseIdentifier: "cellID2")
           collectionRed.register(myCellRed.self, forCellWithReuseIdentifier: "cellID3")

       }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell1 = Int.random(in: 0...1)

        if (collectionView == collectionRed){
              let cell2 = collectionRed.dequeueReusableCell(withReuseIdentifier: "cellID3", for: indexPath) as! myCellRed
              cell2.backgroundColor = .red
              cell2.layer.cornerRadius = 22

              return cell2
            }
        else if (collectionView == collectionBlue){
              let cell3 = collectionBlue.dequeueReusableCell(withReuseIdentifier: "cellID2", for: indexPath) as! myCellBlue
            cell3.backgroundColor = .darkText
              cell3.layer.cornerRadius = 22
              return cell3
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID1", for: indexPath) as! CollectionViewCell
            if indexPath.row % 2 == 0 {
                cell.backgroundColor = .cyan
                cell.layer.cornerRadius = 22
                cell.label1.text = "✅"}
    //            arrture.append(indexPath.row)
                
            else {
                cell.backgroundColor = .link
                      cell.layer.cornerRadius = 22
                cell.label1.text = "❌"
    //            arryfolse.append(indexPath.row)
            }
            return cell

        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
        if collectionView == CollectionView11 {
            let cell4 = CollectionView11.cellForItem(at: indexPath)as!CollectionViewCell
            if cell4.label1.text == "✅" {
                arryfolse.append(String(indexPath.row))
                arrture.remove(at: indexPath.row)
                       CollectionView11.deleteItems(at: [indexPath])
                       collectionBlue.reloadData()
                       CollectionView11.reloadData()
            }
            else if cell4.label1.text == "❌"{
                arrbool.append(String(indexPath.row))
                arrture.remove(at: indexPath.row)
                CollectionView11.deleteItems(at: [indexPath])
                collectionRed.reloadData()
                CollectionView11.reloadData()
            }
        }
    }
}
    


class myCellBlue : UICollectionViewCell {
    @IBOutlet weak var label2: UILabel!
    
}
class myCellRed : UICollectionViewCell {
    
    @IBOutlet weak var label3: UILabel!
}


