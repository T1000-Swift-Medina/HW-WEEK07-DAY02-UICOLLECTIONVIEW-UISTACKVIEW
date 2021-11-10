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
    //    var selectedBlueBallsArray: [Int] = []
    //    var selectedRedBallsArray: [Int] = []
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == allBallsCollectionV {return allBallsArray.count}
        else if collectionView == soccerBallsCollectionV {return soccerBallsArray.count}
        else {return basketBallsArray.count}
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if allBallsCollectionV == collectionView{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainCellID", for: indexPath) as! MyCollCell
            let balls = Int.random(in: 0...1)
            
            if (balls == 0) {
                cell.allBalls.text = "⚽️"
                soccerBallsArray.append(indexPath.row)
            }
            else{
                cell.allBalls.text = "🏀"
                basketBallsArray.append(indexPath.row)
            }
            return cell
        }else if soccerBallsCollectionV == collectionView{
            
            let soccerB = collectionView.dequeueReusableCell(withReuseIdentifier: "soccerCellID", for: indexPath) as! MyCollCell
            return soccerB
            
        }
        else {
            
            let basketB = collectionView.dequeueReusableCell(withReuseIdentifier: "basketCellID", for: indexPath) as! MyCollCell
            return basketB
            
        }
        
    }
    func collectionView(_ collectionView: UICollectionView,didSelectItemAt indexPath: IndexPath){
        
        if collectionView == allBallsCollectionV {
            basketBallsArray.append(allBallsArray[indexPath.row])
            allBallsArray.remove(at: indexPath.row)
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
