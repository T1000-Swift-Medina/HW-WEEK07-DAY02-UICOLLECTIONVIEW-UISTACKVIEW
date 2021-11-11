//
//  ViewController.swift
//  HW 6
//
//  Created by لمى فرحان on 03/04/1443 AH.


import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{
    var balls : [Int] = []
    var blueBalls: [Int] = []
    var redBalls: [Int] = []
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == cvMain1 {
            return balls.count
            
        }else if collectionView == redballs {
            return redBalls.count
            
        }else {
            return blueBalls.count
        }
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == cvMain1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath) as! MyCollectionViewCell
            if (balls[indexPath.row] == 0 ) {
                cell.title.text = "🔴"
            } else  {
                cell.title.text = "🔵"
            }
            return cell
            
        } else if collectionView == redballs {
            let right = collectionView.dequeueReusableCell(withReuseIdentifier: "redID", for: indexPath) as! MyCollectionViewCell
            right.redballs.text = "🔴"
            return right
        } else {
            let left = collectionView.dequeueReusableCell(withReuseIdentifier: "blueID", for: indexPath) as! MyCollectionViewCell
            left.blueballs.text = "🔵"
            return left
        }
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView,didSelectItemAt indexPath: IndexPath){
        if collectionView == cvMain1 {
            if (balls[indexPath.row] == 1 ){
                blueBalls.append(balls[indexPath.row])
                balls.remove(at: indexPath.row)
            } else {
                balls.remove(at: indexPath.row)
                redBalls.append(0)
                
            }
        }else if collectionView  == redballs {
            balls.append(redBalls[indexPath.row])
            redBalls.remove(at: indexPath.row)
        }else{
            balls.append(blueBalls[indexPath.row])
            blueBalls.remove(at: indexPath.row)
        }
        cvMain1.reloadData()
        redballs.reloadData()
        blueballs.reloadData()
    }
    
    
    
    
    @IBOutlet weak var redballs: UICollectionView!
    @IBOutlet weak var blueballs: UICollectionView!
    @IBOutlet weak var cvMain1: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for _ in 0 ... 100 {
            let x = Int.random(in: 0...1)
            balls.append(x)
        }
        
        cvMain1.delegate = self
        cvMain1.dataSource = self
        
        redballs.delegate = self
        redballs.dataSource = self
        blueballs.delegate = self
        blueballs.dataSource = self
        
        
    }
    
}

