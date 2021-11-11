//
//  ViewController.swift
//  HomeWork - Collections
//
//  Created by Noura Alahmadi on 04/04/1443 AH.
//

import UIKit

class ViewController: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource{
    
    @IBOutlet weak var allBallsCollectionV: UICollectionView!
    @IBOutlet weak var soccerBallsCollectionV: UICollectionView!
    @IBOutlet weak var basketballsCollectionv: UICollectionView!
    
    var allBallsArray: [Int] = []
    var soccerBallsArray: [Int] = []
    var basketBallsArray: [Int] = []
//    var selectedsoccerBallsArray: [Int] = []
//    var selectedbasketBallsArray: [Int] = []
//
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == allBallsCollectionV {return allBallsArray.count}
        else if collectionView == soccerBallsCollectionV {return soccerBallsArray.count}
        else {return basketBallsArray.count}
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == allBallsCollectionV
{            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainCellID", for: indexPath) as! MyCollCell
            
            if (allBallsArray[indexPath.row] == 0) {
                cell.allBalls.text = "⚽️"
                //soccerBallsArray.append(indexPath.row)
            }
            else {
                cell.allBalls.text = "🏀"
                //basketBallsArray.append(indexPath.row)
            }
            return cell
            
        }else if  collectionView == soccerBallsCollectionV{
            
            let soccerCell = collectionView.dequeueReusableCell(withReuseIdentifier: "soccerCellID", for: indexPath) as! MyCollCell
            soccerCell.soccerBalls.text = "⚽️"
            return soccerCell
            
        }
        else {
            
            let basketCell = collectionView.dequeueReusableCell(withReuseIdentifier: "basketCellID", for: indexPath) as! MyCollCell
            basketCell.basketBalls.text = "🏀"
            return basketCell
            
        }
        
    }
    func collectionView(_ collectionView: UICollectionView,didSelectItemAt indexPath: IndexPath){
        
        if collectionView == allBallsCollectionV {
            
            if (allBallsArray[indexPath.row] == 0){
    
                soccerBallsArray.append(allBallsArray[indexPath.row])
                allBallsArray.remove(at: indexPath.row)
                
            }else{
                
                basketBallsArray.append(allBallsArray[indexPath.row])
                allBallsArray.remove(at: indexPath.row)
            }
            
        }else if collectionView == basketballsCollectionv{
            
            allBallsArray.append(basketBallsArray[indexPath.row])
            basketBallsArray.remove(at: indexPath.row)
            
        }else{
            
            allBallsArray.append(soccerBallsArray[indexPath.row])
            soccerBallsArray.remove(at: indexPath.row)
        }
        
        allBallsCollectionV.reloadData()
        soccerBallsCollectionV.reloadData()
        basketballsCollectionv.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        allBallsCollectionV.delegate = self
        allBallsCollectionV.dataSource = self
        
        soccerBallsCollectionV.delegate = self
        soccerBallsCollectionV.dataSource = self
        
        basketballsCollectionv.delegate = self
        basketballsCollectionv.dataSource = self
        
        for _ in 1 ... 10 {
            allBallsArray.append(Int.random(in: 0 ... 1))
        }
        
    }
    
}






/*
 - Make CustomCell for the CollectionViewCell hande 3 labels (1-allBalls , 2-blueBalls , 3-redBalls)
 - Declering 2 arrays in viewController for saving the velue of balls (1-blueBallsArray , 2-redBallsArray)
 - Declering 2 arrays in viewController for saving the velue of selectedBalls (1-selectedBlueBallsArray ,2-selectedRedBallsArray)
 - Make random Valus for balls in viewController of rang 0...1
 - Dequeue the CustomCell in viewController
 */


/*
 - Change the names from Blueball to soccerBalls and redBalls to basketBalls
 - Declering one more array for the allBalls
 - add func didSelectItemAt from collection View
 */

/*
 - Add more conddition to append / Remove the items from arrays
 - the app is working in this virsion
 */
