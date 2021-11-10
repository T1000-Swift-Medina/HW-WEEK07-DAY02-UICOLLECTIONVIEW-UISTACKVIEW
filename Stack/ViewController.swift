//
//  ViewController.swift
//  Stack
//
//  Created by Rahaf Abdulaal on 05/04/1443 AH.
//

import UIKit

class ViewController: UIViewController , UICollectionViewDataSource , UICollectionViewDelegate {
    
    
    var removeCell = ""
    var removeCell2 = ""
    var removeCell3 = ""
    var MainArr  = [Int]()
    var yellowArray = [Int]()
    var pinkArray = [Int]()
    
    @IBOutlet weak var MainCollection: UICollectionView!
    @IBOutlet weak var yellowCollecton: UICollectionView!
    @IBOutlet weak var pinkCollection: UICollectionView!
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(collectionView == MainCollection){
           return MainArr.count
            
        }
           else if(collectionView == yellowCollecton){
               return yellowArray.count
        }
        else
        {
            return pinkArray.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
        if(collectionView == MainCollection && MainArr [indexPath.row] % 2 == 0 ){
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellID", for: indexPath as IndexPath) as! MainViewCell
            cell.layer.cornerRadius = 25
            cell.backgroundColor = .systemBlue
            
            cell.mainCell.text = String (MainArr[indexPath.row])
        return cell
   } else if(collectionView == MainCollection && MainArr [indexPath.row] % 2 != 0 ){
       let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellID", for: indexPath as IndexPath) as! MainViewCell
       cell.layer.cornerRadius = 25
       cell.backgroundColor = .systemPink
       cell.mainCell.text = String (MainArr[indexPath.row])
   return cell
   }
        else if (collectionView == yellowCollecton){
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellID", for: indexPath as IndexPath) as! YellowViewCell
            cell.layer.cornerRadius = 25
            cell.backgroundColor = .systemBlue

            cell.yellowLabel.text = String(yellowArray[indexPath.row])
        return cell
        }
        else{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellID", for: indexPath as IndexPath) as! PinkViewCell
            cell.layer.cornerRadius = 25
            cell.backgroundColor = .systemPink

            cell.pinkLabel.text = String (pinkArray[indexPath.row])
    return cell
        }
    }
//        if indexPath.row % 2 == 0{
//            cell.backgroundColor = .blue
//            cell.layer.cornerRadius = 20
//        }else{
//            cell.backgroundColor = .systemPink
//           cell.layer.cornerRadius = 20
//        }
//        return cell
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
         if(collectionView == MainCollection)
         {
             let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellID", for: indexPath as IndexPath) as! MainViewCell
//             removeCell = (MainArr[indexPath.row])

             if MainArr [indexPath.row] % 2 == 0{
             yellowArray.append(MainArr[indexPath.row])
             MainArr.remove(at: indexPath.row)
             
             }
             else{
                 pinkArray.append(MainArr[indexPath.row])
                 MainArr.remove(at: indexPath.row)
             }
             MainCollection.reloadData()
             yellowCollecton.reloadData()
             pinkCollection.reloadData()


         }
            else if(collectionView == yellowCollecton)
             {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellID", for: indexPath as IndexPath) as! YellowViewCell

                MainArr.append(yellowArray[indexPath.row])
                yellowArray.remove(at: indexPath.row)
                MainCollection.reloadData()
                yellowCollecton.reloadData()
                pinkCollection.reloadData()

             }
         else{

             let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellID", for: indexPath as IndexPath) as! PinkViewCell
             MainArr.append(pinkArray[indexPath.row])
             pinkArray.remove(at: indexPath.row)
             MainCollection.reloadData()
             yellowCollecton.reloadData()
             pinkCollection.reloadData()
         }
         collectionView.reloadData()
         }
    
    
override func viewDidLoad() {
    super.viewDidLoad()
    MainCollection.delegate = self
    MainCollection.dataSource = self
    yellowCollecton.delegate = self
    yellowCollecton.dataSource = self
    pinkCollection.delegate = self
    pinkCollection.dataSource = self
    
    for i in 1...50 {
        MainArr.append(i)
    }
}
}


