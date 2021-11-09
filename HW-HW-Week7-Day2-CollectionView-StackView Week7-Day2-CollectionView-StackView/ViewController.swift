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
        for n in 1...30{
            arrture.append(String(n))
        }
        CollectionView11.register(myCellBlue.self, forCellWithReuseIdentifier: "myCellBlue")
           collectionRed.register(myCellRed.self, forCellWithReuseIdentifier: "myCellRed")

       }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID1", for: indexPath) as! CollectionViewCell
        cell.label1.text = String(indexPath.row + 1)
        let cell1 = Int.random(in: 0...1)
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = .cyan
            cell.layer.cornerRadius = 22
            cell.label1.text = "✅"}
//            arrture.append(indexPath.row)
            
        else {
            cell.backgroundColor = .systemPink
                  cell.layer.cornerRadius = 22
            cell.label1.text = "❌"
//            arryfolse.append(indexPath.row)
        }
        if (collectionView == collectionRed){
              let cell2 = collectionRed.dequeueReusableCell(withReuseIdentifier: "myCellRed", for: indexPath) as! myCellRed
              cell2.backgroundColor = .red
              cell2.layer.cornerRadius = 22
              return cell2
            }
        else if (collectionView == collectionBlue){
              let cell3 = collectionBlue.dequeueReusableCell(withReuseIdentifier: "myCellBlue", for: indexPath) as! myCellBlue
              cell3.backgroundColor = .blue
              cell3.layer.cornerRadius = 22
              return cell3
    }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
        if collectionView == CollectionView11 {
            let cell4 = CollectionView11.cellForItem(at: indexPath)as!CollectionViewCell
            if cell4.label1.text == "✅" {
//                print(“User select blue square number #\(indexPath.row)“)
                       arrture.remove(at: indexPath.row)
                       CollectionView11.deleteItems(at: [indexPath])
                       arryfolse.append(String(indexPath.row))
                       collectionBlue.reloadData()
                       CollectionView11.reloadData()
            }
            else if cell4.label1.text == "❌"{
                arrture.remove(at: indexPath.row)
                CollectionView11.deleteItems(at: [indexPath])
                arrbool.append(String(indexPath.row))
                collectionBlue.reloadData()
                CollectionView11.reloadData()
            }
        }
    }


}
    

class mycollection : UICollectionViewCell {
    
}
class myCellBlue : UICollectionViewCell {
    
}
class myCellRed : UICollectionViewCell {
    
}


