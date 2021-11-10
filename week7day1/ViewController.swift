

import UIKit

class ViewController: UIViewController,UICollectionViewDataSource , UICollectionViewDelegate {
  
    
    var firstArray = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36]
   
    var secondArray = [Int]()
    var thirdArray = [Int]()
    
    
    @IBOutlet weak var CollectionView1: UICollectionView!
    @IBOutlet weak var CollectionView2: UICollectionView!
    @IBOutlet weak var CollectionView3: UICollectionView!
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
     //  36
//
        if collectionView == CollectionView1{
            return firstArray.count }
       
        else if collectionView == CollectionView2{
            return secondArray.count
        }
        else{
            return thirdArray.count
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == self.CollectionView1 {
         let cell = CollectionView1.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath as IndexPath) as! CollectionViewCell1
            cell.myLabel?.text = String (firstArray[indexPath.item])

            return cell}
        else if collectionView == self.CollectionView2 {
            let cell2 = CollectionView2.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath as IndexPath) as! CollectionViewCell2
            cell2.FirstLabel.text = String (secondArray[indexPath.item])
           
          
       
            return cell2}
        
        else {
            let cell3 = CollectionView3.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath as IndexPath) as! CollectionViewCell3
        
            cell3.SecondLabel.text = String (thirdArray[indexPath.item])
        return cell3
        }}
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == CollectionView1{
        
            if let cell2 = CollectionView2.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath as IndexPath) as? CollectionViewCell2{
            if firstArray[indexPath.row] % 2 == 0 {
               
                secondArray.append(firstArray[indexPath.row])
                firstArray.remove(at: indexPath.row)
                
            }
                else {
                    thirdArray.append(firstArray[indexPath.row])
                    firstArray.remove(at: indexPath.row)
                }
               
              
                
                print(cell2.FirstLabel.text!)
                print(secondArray)
                print(firstArray)
                
            }
            
        }
        if collectionView == CollectionView2 {
        
           
               
                firstArray.append(secondArray[indexPath.row])
                secondArray.remove(at: indexPath.row)
                
            
            
              
                
               
        }
            
            
        
        if collectionView == CollectionView3{
        
           
                firstArray.append(thirdArray[indexPath.row])
                thirdArray.remove(at: indexPath.row)
                
            
               
               
               
                
               
                
            
            
        }
        CollectionView1.reloadData()
        CollectionView2.reloadData()
        CollectionView3.reloadData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        CollectionView1.delegate = self
        CollectionView1.dataSource = self
//        CollectionView1.register(CollectionViewCell1.self, forCellWithReuseIdentifier: "MyCell")
//        view.addSubview(CollectionView1)

        CollectionView2.delegate = self
        CollectionView2.dataSource = self
//        CollectionView2.register(CollectionViewCell2.self, forCellWithReuseIdentifier: "MyCell")
//        view.addSubview(CollectionView2)
//
        CollectionView3.delegate = self
        CollectionView3.dataSource = self
//        CollectionView3.register(CollectionViewCell3.self, forCellWithReuseIdentifier: "MyCell")
//        view.addSubview(CollectionView3)
}
}

