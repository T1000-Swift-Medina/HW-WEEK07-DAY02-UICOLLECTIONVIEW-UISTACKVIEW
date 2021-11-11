//
//  ViewController.swift
//  StacViewAndCollectionV
//
//  Created by Abdullah Bajaman on 09/11/2021.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    var mainArray : [Int] = []
    var oddArray : [Int] = []
    var evenArray : [Int] = []
    
    @IBOutlet weak var mainCollection: UICollectionView!
    @IBOutlet weak var evenCollection: UICollectionView!
    @IBOutlet weak var oddCollection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        mainCollection.dataSource = self
        mainCollection.delegate = self
        
        
        for i in 1...42 {
            mainArray.append(i)
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case mainCollection:
            return mainArray.count
        case evenCollection:
            return evenArray.count
        case oddCollection:
            return oddArray.count
        default:
            return mainArray.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView { // ToDo: var item then one return
        case mainCollection:
            let item = mainCollection.dequeueReusableCell(withReuseIdentifier: "mainCellID", for: indexPath) as! MainCell
            let itemContent = mainArray[indexPath.row]
            item.lable.text = "\(itemContent)"
            item.layer.cornerRadius = 25
            
            // change cell color depends on even or odd
            if itemContent % 2 == 0 {
                item.backgroundColor = .green
            }else {
                item.backgroundColor = .blue
            }
            return item
        case evenCollection:
            let item = evenCollection.dequeueReusableCell(withReuseIdentifier: "evenCellID", for: indexPath) as! EvenCell
            item.evenLbl.text = (String(evenArray[indexPath.row]))
            item.layer.cornerRadius = 25
            item.backgroundColor = .green
            return item
        case oddCollection:
            let item = oddCollection.dequeueReusableCell(withReuseIdentifier: "oddCellID", for: indexPath) as! OddCell
            item.oddLbl.text = String(oddArray[indexPath.row])
            item.layer.cornerRadius = 25
            item.backgroundColor = .blue
            return item
        default:
            return mainCollection.dequeueReusableCell(withReuseIdentifier: "mainCellID", for: indexPath)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        oddCollection.dataSource = self
        oddCollection.delegate = self
        evenCollection.dataSource = self
        evenCollection.delegate = self
        
        switch collectionView {
        case mainCollection:
            
            if mainArray[indexPath.row] % 2 == 0 { // if even
                evenArray.append(mainArray[indexPath.row])
                mainArray.remove(at: indexPath.row)
            } else {
                oddArray.append(mainArray[indexPath.row])
                mainArray.remove(at: indexPath.row)
            }
            
        case evenCollection :

            mainArray.append(evenArray[indexPath.row])
            evenArray.remove(at: indexPath.row)
            
        case oddCollection : // Note: remove not work untill i fixed the constraints
            
            mainArray.append(oddArray[indexPath.row])
            oddArray.remove(at: indexPath.row)

        default:
            break
        }
        
        evenCollection.reloadData()
        oddCollection.reloadData()
        mainCollection.reloadData()
    }
    
}

