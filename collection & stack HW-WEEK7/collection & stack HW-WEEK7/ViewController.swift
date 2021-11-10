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
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath) as! CustomCell
//        cell.Numbers.text = String([Int])
        return cell
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
    }


}

