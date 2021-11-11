//
//  ViewController.swift
//  collection & stack HW-WEEK7
//
//  Created by Raghad Alahmadi on 05/04/1443 AH.
//

import UIKit

class ViewController: UIViewController , UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var numbersCollection: UICollectionView!
    @IBOutlet weak var oddCollection: UICollectionView!
    @IBOutlet weak var evenCollection: UICollectionView!
    
    
    var numbersArray : [Int] = []
    var oddNumbersArray: [Int] = []
    var evenNumbersArray: [Int] = []
//    var selectedRedBallsArray: [Int] = []
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 60
        
        
        if collectionView == numbersCollection {
            return numbersArray.count }
         else if collectionView == oddCollection {
             return oddNumbersArray.count}
         else {
             return evenNumbersArray.count}
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if  collectionView == numbersCollection  {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath) as! CustomCell
                cell.Numbers.text = String(numbersArray[indexPath.row])
            
            if (collectionView == numbersCollection && numbersArray[indexPath.row] % 2 == 0) {
                evenNumbersArray[indexPath.row]
//                cell.Numbers.text 
                
                
            }
            else {
                oddNumbersArray[indexPath.row]
            }
            
//        let numbers = Int(60)
            return cell
            
        }
            
            else if  collectionView == oddCollection {
               let oddCell =  collectionView.dequeueReusableCell(withReuseIdentifier: "ocellID", for: indexPath)as! CustomCell
//                oddNumbersArray[indexPath.row]
                oddCell.oddNum.text = String(oddNumbersArray[indexPath.row])
                //[indexPath.row]
                
         return oddCell
                
     }
        
        else {
            let evenCell =   collectionView.dequeueReusableCell(withReuseIdentifier: "ecellID", for: indexPath)as! CustomCell
//           evenNumbersArray[indexPath.row]
            evenCell.evenNum.text = String(oddNumbersArray[indexPath.row])
           
            return evenCell
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,didSelectItemAt indexPath: IndexPath){
        
        if collectionView == numbersCollection {
//           oddCollection.append(numbersArray[indexPath.row])
//            numbersArray.remove(at: indexPath.row)
          
            if numbersArray [indexPath.row] % 2 == 0{
            evenNumbersArray.append(numbersArray[indexPath.row])
            numbersArray.remove(at: indexPath.row)
            
            }
            else{
                oddNumbersArray.append(numbersArray[indexPath.row])
               numbersArray.remove(at: indexPath.row)
            }
            numbersCollection.reloadData()
              evenCollection.reloadData()
            oddCollection.reloadData()
            
        }
            
            else if (collectionView == evenCollection) {
                
          

               numbersArray.append(evenNumbersArray[indexPath.row])
               evenNumbersArray.remove(at: indexPath.row)
                numbersCollection.reloadData()
                  evenCollection.reloadData()
                 oddCollection.reloadData()
            }
        else{

         
         numbersArray.append(oddNumbersArray[indexPath.row])
           oddNumbersArray.remove(at: indexPath.row)
           numbersCollection.reloadData()
            evenCollection.reloadData()
           oddCollection.reloadData()
        }
        collectionView.reloadData()
            
        }
        
     

   


    override func viewDidLoad() {
        super.viewDidLoad()
        numbersCollection.dataSource = self
        numbersCollection.delegate = self

        oddCollection.dataSource = self
        oddCollection.delegate = self

        evenCollection.dataSource = self
        evenCollection.delegate = self
        // Do any additional setup after loading the view.
        
        for i in 1...100 {
            numbersArray.append(i)
        }
    }

}



