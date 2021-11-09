//
//  ViewController.swift
//  HW-Week7-Day2
//
//  Created by Afnan Theb on 03/04/1443 AH.
//

import UIKit

class ViewController: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource {
    
    var arryBlue : [Int] = []
    var arryRead : [Int] = []
    var selectRed : [Int] = []
    var selectBlue : [Int] = []
    var findRed : Int?
    var findBlue : Int?
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == MainCV {
            return 24
        }else if collectionView == blueCollection {
            return selectBlue.count
        }else {
            return selectRed.count
        }
          
}// end func
                 
                

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if MainCV == collectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellOne", for: indexPath ) as! HWCustomCell
            let ran = Int.random(in: 0...1)
            
            if (ran == 0 && collectionView == MainCV )
            { cell.title.text = "🟦"
                arryBlue.append(indexPath.row)
                print("Blue", arryBlue)
            }else if (ran == 1 && collectionView == MainCV ){
              cell.title.text = "🟥"
                arryRead.append(indexPath.row)
                print("Red", arryRead)
            }
            return cell
        } else if blueCollection == collectionView{
            
            let blueCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellBlue", for: indexPath ) as! HWCustomCell
            
            
            
            
            return blueCell
        } else {
            let redCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellRed", for: indexPath ) as! HWCustomCell
          
            
            return redCell
        }
        
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       if collectionView == MainCV {
         //print(  indexPath.row)
         findRed = arryRead.firstIndex(where:{ $0 == indexPath.row })
         if ( findRed == nil )
           {findBlue = arryBlue.firstIndex(where:{ $0 == indexPath.row })
             arryBlue.remove(at: findBlue!)
             selectBlue.append(0)
         }else {
             arryRead.remove(at: findRed!)
             selectRed.append(0)
         }//end else
           
        }
//      if
        
    }
    
    
    
    @IBOutlet weak var blueCollection: UICollectionView!
    @IBOutlet weak var redCollection: UICollectionView!
    @IBOutlet weak var MainCV: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        MainCV.delegate = self
        MainCV.dataSource = self
        
        blueCollection.delegate = self
        blueCollection.dataSource = self
        redCollection.delegate = self
        redCollection.dataSource = self
        
    }


}

