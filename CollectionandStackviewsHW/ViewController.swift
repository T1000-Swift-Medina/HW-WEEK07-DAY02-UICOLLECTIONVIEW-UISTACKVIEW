

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var removedValue = ""
    var removedValue2 = ""
    var removedValue3 = ""
    var arrayOne = ["1","2","3","4","5","6"]
    var arrayTwo = [String]()
    var arrayThree = [String]()
//
//    var arrayTwo = ["11","22","33","44","55","66"]
//    var arrayThree = ["222","333","999","444","555","655"]

    @IBOutlet weak var firstCollection: UICollectionView!
    
    @IBOutlet weak var secondCollection: UICollectionView!
    
    @IBOutlet weak var thiredCollection: UICollectionView!
    
    
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         
         if(collectionView == firstCollection){
             
            return arrayOne.count
             
         }
            else if(collectionView == secondCollection){
                
                return arrayTwo.count
         }
         else
         {
             return arrayThree.count
         }
     }
     
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         
         if(collectionView == firstCollection){
             let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath as IndexPath) as! CollectionViewCell
             cell.layer.cornerRadius = 25
             cell.numLable.text = arrayOne[indexPath.row]
         return cell
    }
         else if (collectionView == secondCollection){
             let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath as IndexPath) as! CollectionViewCell2
             cell.layer.cornerRadius = 25

             cell.celllable2.text = arrayTwo[indexPath.row]
         return cell
         }
         else{
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath as IndexPath) as! CollectionViewCell3
             cell.layer.cornerRadius = 25

             cell.lable3inCell3.text = arrayThree[indexPath.row]
     return cell
         }
     }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        
       
        if(collectionView == firstCollection)
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath as IndexPath) as! CollectionViewCell
            print("selected")
            
            
            removedValue = arrayOne[indexPath.row]
            let b: Int! = Int(removedValue)
            if(b%2 == 0){
            arrayOne.remove(at: indexPath.row)
            arrayTwo.append(removedValue)
            }
            else{
                arrayOne.remove(at: indexPath.row)
                arrayThree.append(removedValue)
            }
      

            firstCollection.reloadData()
            secondCollection.reloadData()
            thiredCollection.reloadData()


 
        }
           else if(collectionView == secondCollection)
            {
                let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath as IndexPath) as! CollectionViewCell2
                print("selected in second")
               
                removedValue2 = arrayTwo[indexPath.row]
                arrayOne.append(removedValue2)
                arrayTwo.remove(at: indexPath.row)
                firstCollection.reloadData()
                secondCollection.reloadData()
               thiredCollection.reloadData()

            }
        else{
            
            let cell3 = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath as IndexPath) as! CollectionViewCell3
            print("selected in third")
            removedValue3 = arrayThree[indexPath.row]
            arrayThree.remove(at: indexPath.row)
            arrayOne.append(removedValue3)
            firstCollection.reloadData()
            secondCollection.reloadData()
            thiredCollection.reloadData()
        }
        collectionView.reloadData()
        }
  
   



    override func viewDidLoad() {
        super.viewDidLoad()
        firstCollection.delegate = self
        firstCollection.dataSource = self
        secondCollection.delegate = self
        secondCollection.dataSource = self
        thiredCollection.delegate = self
        thiredCollection.dataSource = self

    
    }
}
    

