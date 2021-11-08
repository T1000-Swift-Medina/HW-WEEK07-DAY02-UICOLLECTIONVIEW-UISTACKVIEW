//
//  ViewController.swift
//  HW-HW-Week7-Day2-CollectionView-StackView Week7-Day2-CollectionView-StackView
//
//  Created by بندر عبيد ثاري الرشيدي on 03/04/1443 AH.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 50
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID1", for: indexPath) as! CollectionViewCell
        return cell
        
    }
    

    
    @IBOutlet weak var CollectionView11: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        CollectionView11.delegate = self
        CollectionView11.dataSource = self
        
    }
    
    
   
}


