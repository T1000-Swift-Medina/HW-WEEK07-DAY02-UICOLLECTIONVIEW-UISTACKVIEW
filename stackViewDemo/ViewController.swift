//
//  ViewController.swift
//  stackViewDemo
//
//  Created by khalid ali on 02/04/1443 AH.
//

import UIKit



class ViewController: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource {
    
    
    @IBOutlet weak var cvMain: UICollectionView!
    @IBOutlet weak var blueCollection: UICollectionView!
    @IBOutlet weak var redCollection: UICollectionView!
    
    
    var originalarray = ["🔴","🔵","🔴","🔵","🔴","🔵","🔴","🔵","🔴","🔵","🔴","🔵","🔴","🔵","🔴","🔵","🔴","🔵","🔴","🔵","🔴","🔵","🔴","🔵","🔴","🔵","🔴","🔵","🔴","🔵","🔴","🔵"]
    
    var bluearray = [""]
    var redarray = [""]
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return originalarray.count
        
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mycellID", for: indexPath) as! Mycell
        
        cell.title.text = originalarray[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if  cvMain == collectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mycellID", for: indexPath ) as! Mycell
            
            originalarray.remove(at: indexPath.row)
            cvMain.reloadData()
            print(originalarray)
        } else if blueCollection == collectionView {

            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellBlue", for: indexPath ) as! BlueCollectionViewCell

        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellRed", for: indexPath ) as! RedCollectionViewCell
        }
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        cvMain.delegate = self
        cvMain.dataSource = self
    }
    
    
}

