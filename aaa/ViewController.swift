//
//  ViewController.swift
//  aaa
//
//  Created by Yazan Alraddadi on 03/04/1443 AH.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource ,UICollectionViewDelegate  {
    
    
    var removedValue = ""
    var removedValue2 = ""
    var removedValue3 = ""
    var BlueArray = [Int]()
    var OrangeArray = [Int]()
    var GreenArray = [Int]()
    
    
    @IBOutlet weak var CollGreen: UICollectionView!
    @IBOutlet weak var CollBlue: UICollectionView!
    @IBOutlet weak var CollOrange: UICollectionView!
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if CollBlue == collectionView {
            return BlueArray.count
        } else if CollOrange == collectionView{
            return OrangeArray.count
        } else {
            return GreenArray.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if(collectionView == CollBlue){
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BlueCellID", for: indexPath as IndexPath) as! CollectionViewCell1
            cell.labelB.text = String(BlueArray[indexPath.row])
            return cell
        }
        else if (collectionView == CollOrange){
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OrangeCellID", for: indexPath as IndexPath) as! CollectionViewCell2
            cell.labelO.text = String(OrangeArray[indexPath.row])
            return cell
        }
        else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GreenCellID", for: indexPath as IndexPath) as! CollectionViewCell3
                      cell.layer.cornerRadius = 25
            cell.labelG.text = String(GreenArray[indexPath.row])
            return cell
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if(collectionView == CollBlue)
        {
           
            if(BlueArray[indexPath.row] % 2 == 0){
                OrangeArray.append(BlueArray[indexPath.row])
                BlueArray.remove(at: indexPath.row)
               
            }
            else{
                GreenArray.append(BlueArray[indexPath.row])
                BlueArray.remove(at: indexPath.row)
               
            }
            
            CollBlue.reloadData()
            CollOrange.reloadData()
            CollGreen.reloadData()
        }
        else if(collectionView == CollOrange)
        {
           
            
            
            BlueArray.append(OrangeArray[indexPath.row])
            OrangeArray.remove(at: indexPath.row)
            CollBlue.reloadData()
            CollOrange.reloadData()
            CollGreen.reloadData()
        }
        else{
          
            BlueArray.append(GreenArray[indexPath.row])
            GreenArray.remove(at: indexPath.row)
            CollBlue.reloadData()
            CollOrange.reloadData()
            CollGreen.reloadData()
        }
        collectionView.reloadData()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CollBlue.delegate = self
        CollBlue.dataSource = self
        CollOrange.delegate = self
        CollOrange.dataSource = self
        CollGreen.delegate = self
        CollGreen.dataSource = self
        
        for i in 1...99{
            BlueArray.append(i)
            
        }
    }}
