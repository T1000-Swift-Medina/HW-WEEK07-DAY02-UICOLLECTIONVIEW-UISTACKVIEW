//
//  ViewController.swift
//  CollectionAndStackVC
//
//  Created by Abdullah Bajaman on 09/11/2021.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    

    var mainArray : [Int] = []
    var oddArray : [Int] = []
    var evenArray : [Int] = []
    
    @IBOutlet weak var mainCollection: UICollectionView!
    @IBOutlet weak var oddCollection: UICollectionView!
    @IBOutlet weak var evenConllection: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        mainCollection.delegate = self
//        mainCollection.dataSource = self
        mainCollection.delegate = self
        mainCollection.dataSource = self
        
        for i in 1...100 {
            mainArray.append(i)
        }
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        
        return 100
//        switch collectionView {
//        case mainCollection:
//            return 100//mainArray.count
//        case evenConllection:
//            return evenArray.count
//        case oddCollection:
//            return oddArray.count
//        default:
//            return mainArray.count
//        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = mainCollection.dequeueReusableCell(withReuseIdentifier: "mainCellID", for: indexPath) as! MainCell
                   item.label.text = String(indexPath.row + 1)
                   return item
        
//        switch collectionView {
//        case mainCollection:
//            let item = mainCollection.dequeueReusableCell(withReuseIdentifier: "mainCellID", for: indexPath) as! MainCell
//            item.label.text = String(indexPath.row + 1)
//            return item
//        case evenConllection:
//            let item = evenConllection.dequeueReusableCell(withReuseIdentifier: "evenCellID", for: indexPath) as! EvenCell
//            item.evenLbl.text = (String(evenArray[indexPath.row + 1]))
//            return item
//        case oddCollection:
//            let item = evenConllection.dequeueReusableCell(withReuseIdentifier: "oddCellID", for: indexPath) as! OddCell
//            item.oddLbl.text = String(oddArray[indexPath.row + 1])
//            return item
//        default:
//            return mainCollection.dequeueReusableCell(withReuseIdentifier: "mainCellID", for: indexPath)
//        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch collectionView {
        case mainCollection:
            if indexPath.row % 2 == 0 {
                  evenArray.append(indexPath.row + 1)
                   
                  evenConllection.dataSource = self
                  evenConllection.delegate = self
                  evenConllection.reloadData()
                } else {
                  oddArray.append(indexPath.row + 1)
                   
                  oddCollection.dataSource = self
                  oddCollection.delegate = self
                  oddCollection.reloadData()
                }
//        case evenConllection :
//            if indexPath.row % 2 == 0 {
//                evenArray.append(indexPath.row + 1)
//
//                evenConllection.dataSource = self
//                evenConllection.delegate = self
//                evenConllection.reloadData()
//            }
//        case oddCollection:
//            if indexPath.row % 2 == 0 {
//                oddArray.append(indexPath.row + 1)
//
//                oddCollection.dataSource = self
//                oddCollection.delegate = self
//                oddCollection.reloadData()
//            }
        default:
            break
        }
    }
    
    
    

}

