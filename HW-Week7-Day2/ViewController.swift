//
//  ViewController.swift
//  HW-Week7-Day2
//
//  Created by Afnan Theb on 03/04/1443 AH.
//

import UIKit

class ViewController: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource {
    
// declar Three variable of array datatype
    var selectRed : [Int] = []
    var selectBlue : [Int] = []
    var mainArray : [Int] = []
//
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == mainCV {
            return mainArray.count
        }else if collectionView == blueCollection {
            return selectBlue.count
        }else {
            return selectRed.count
        }
          
}// end func
//---------------------------( Cell For Item Function )--------------------------
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if mainCV == collectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellOne", for: indexPath ) as! HWCustomCell
         
            
            if (mainArray[indexPath.row] == 0  )
            { cell.title.text = "🟦"
               
            }else if (mainArray[indexPath.row] == 1 ){
              cell.title.text = "🟥"
            }
            return cell
        } else if blueCollection == collectionView{
            
            let blueCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellBlue", for: indexPath ) as! HWCustomCell
            
            blueCell.blueTitle.text =  "🟦"
            return blueCell
        } else {
            let redCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellRed", for: indexPath ) as! HWCustomCell
          
            redCell.redTitle.text = "🟥"
            return redCell
        }
        
        
    }//end func
// ------------------------(did select Item function)--------------------------
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       // collection View Main CV
       if collectionView == mainCV {
           if (mainArray[indexPath.row] == 0){
               mainArray.remove(at: indexPath.row)
               selectBlue.append(0)
           }else {
               mainArray.remove(at: indexPath.row)
               selectRed.append(1)
           }
       // collection View Blue collection
       } else if collectionView == blueCollection {
           selectBlue.remove(at: indexPath.row)
           mainArray.append(0)
       //  collection View Red collection
       } else {
           selectRed.remove(at: indexPath.row)
           mainArray.append(1)
       }
        // reloading all collections >>
        mainCV.reloadData()
        redCollection.reloadData()
        blueCollection.reloadData()
        
    }// end func
//------------------------------------------------------------------------
    
    // connecting ..
    @IBOutlet weak var blueCollection: UICollectionView!
    @IBOutlet weak var redCollection: UICollectionView!
    @IBOutlet weak var mainCV: UICollectionView!
// ------------------------(view Did Load function)--------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        mainCV.delegate = self
        mainCV.dataSource = self
        //------
        blueCollection.delegate = self
        blueCollection.dataSource = self
        //------
        redCollection.delegate = self
        redCollection.dataSource = self

        // initializing mainArray 24 element 0 or 1
        for _ in 0...23 {
            let random = Int.random(in: 0...1)
            mainArray.append(random)
        } // end for Loop
        
    } // end func
//---------------

}// end class

