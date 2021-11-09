//
//  ViewController.swift
//  HomeWork - Collections
//
//  Created by Noura Alahmadi on 04/04/1443 AH.
//

import UIKit

class ViewController: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource{
    
    @IBOutlet weak var allBallsCollectionV: UICollectionView!
    @IBOutlet weak var blueBallsCollectionV: UICollectionView!
    @IBOutlet weak var redBallsCollectionv: UICollectionView!
    
    
    
    //    var arrAllBalls: [Int] = []
    var blueBallsArray: [Int] = []
    var redBallsArray: [Int] = []
    var selectedBlueBallsArray: [Int] = []
    var selectedRedBallsArray: [Int] = []
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == allBallsCollectionV {return 50}
        else if collectionView == blueBallsCollectionV {return blueBallsArray.count}
        else {return redBallsArray.count}
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainCellID", for: indexPath) as! MyCollCell
        
        let balls = Int.random(in: 0...1)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
}






/*
 - Make CustomCell for the CollectionViewCell hande 3 labels (1-allBalls , 2-blueBalls , 3-redBalls)
 - Declering 2 arrays in viewController for saving the velue of balls (1-blueBallsArray , 2-redBallsArray)
 - Declering 2 arrays in viewController for saving the velue of selectedBalls (1-selectedBlueBallsArray ,2-selectedRedBallsArray)
 - Make random Valus for balls in viewController of rang 0...1
 - Dequeue the CustomCell in viewController
*/
