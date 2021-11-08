//
//  ViewController.swift
//  stackViewDemo
//
//  Created by khalid ali on 02/04/1443 AH.
//

import UIKit

class ViewController: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mycellID", for: indexPath) as! Mycell
        
        let rand = Int.random(in: 1...20)
        
        if (indexPath.row >= rand) {
            cell.title.text = String("🔵")
            
        }
        else {
            cell.title.text = String("🔴")
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
//        if cvMain == CollectionView1 {
//                   self.performSegueWithIdentifier("fromFirstCollectionView", sender: nil);
//               } else if collectionView == collectionView2 {
//                   // from other CollectionView
//               }
        
        let cell = indexPath.item
        print(cell)
        
        
    }
    

    @IBOutlet weak var cvMain: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        cvMain.delegate = self
        cvMain.dataSource = self
    }
}

