//
//  ViewController.swift
//  HomeWorkStackview&CollectionView
//
//  Created by Mohammed Mabruk on 03/04/1443 AH.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var arr1  : [Int] = []
    var arr2 : [Int] = []
    var arr3 : [Int] = []
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (collectionView == CV1){
            return arr1.count
        }else if (collectionView == collecB){
            return arr2.count
        } else {
            return arr3.count
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CV1.delegate = self
        CV1.dataSource = self
        
        for n in 1...5{
            arr1.append(n)
           
        }
        arr1.shuffle()
        
        collecB.register(myCellBlue.self, forCellWithReuseIdentifier: "myCellBlue")

        collecR.register(myCellRed.self, forCellWithReuseIdentifier: "myCellRed")
    
    
  // Do any additional setup after loading the view.
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        

        if(collectionView == CV1){
            let cell = CV1 .dequeueReusableCell(withReuseIdentifier: "cellID1", for: indexPath) as! myCollectionViewCell_1
            
       // cell.label.text = String(indexPath.row + 1)
        cell.label.text = String(arr1[indexPath.row])
        if arr1[indexPath.row] % 2 == 0 {
            
        cell.backgroundColor = .cyan
        cell.layer.cornerRadius = 22
            return cell
        }
            else {
            cell.backgroundColor = .systemPink
            cell.layer.cornerRadius = 22
                return cell
        }
            
        }
    
       else if (collectionView == collecR){
            let cell2 = collecR.dequeueReusableCell(withReuseIdentifier: "myCellRed", for: indexPath) as! myCellRed
            //cell2.backgroundColor = .red
          //  cell.backgroundColor = .cyan
            cell2.backgroundColor = .cyan
            cell2.layer.cornerRadius = 22
            return cell2
        }
        
        else{
            let cell3 = collecB.dequeueReusableCell(withReuseIdentifier: "myCellBlue", for: indexPath) as! myCellBlue
          //  cell.backgroundColor = .systemPink
            cell3.backgroundColor = .systemPink
            cell3.layer.cornerRadius = 22
            return cell3
        }
    }

     
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == CV1 {
            let cellSelected = CV1.cellForItem(at: indexPath) as! myCollectionViewCell_1
                      if (Int(cellSelected.label.text!)! % 2 != 0) {
               // print("User select blue square number #\(indexPath.row )+ \(arr1[indexPath.row])")
                arr2.append(arr1[indexPath.row])
                arr1.remove(at: indexPath.row)
                CV1.deleteItems(at: [indexPath])
                
                collecB.reloadData()
               CV1.reloadData()
            }
            
            else  {
                //print("User select red square number #\(indexPath.row )+\(arr1[indexPath.row])")
                arr3.append(arr1[indexPath.row])
                arr1.remove(at: indexPath.row)
                CV1.deleteItems(at: [indexPath])
                
               collecR.reloadData()
                CV1.reloadData()
            }

            
         
        } else if collectionView == collecB {
            collecB.cellForItem(at: indexPath)
            
                print("User select blue square number #\(indexPath.row)")
                arr1.append(arr2[indexPath.row])
                arr2.remove(at: indexPath.row)
                collecB.deleteItems(at: [indexPath])
                
           CV1.reloadData()
            collecB.reloadData()
        
        }
        else if collectionView == collecR {
            collecR.cellForItem(at: indexPath)
            
                print("User select blue square number #\(indexPath.row)")
                arr1.append(arr3[indexPath.row])
                arr3.remove(at: indexPath.row)
                collecR.deleteItems(at: [indexPath])
                
            CV1.reloadData()
           collecR.reloadData()
        }
        
    }
    

    @IBOutlet weak var collecB: UICollectionView!
    
    @IBOutlet weak var collecR: UICollectionView!
    
    @IBOutlet weak var CV1: UICollectionView!
    


}

class myCollectionViewCell_1: UICollectionViewCell {
    @IBOutlet weak var label: UILabel!
    
}

class myCellBlue: UICollectionViewCell {
   
    @IBOutlet weak var blueLable: UILabel!
    
    
}
class myCellRed: UICollectionViewCell {
    @IBOutlet weak var redlable: UILabel!
    
}
