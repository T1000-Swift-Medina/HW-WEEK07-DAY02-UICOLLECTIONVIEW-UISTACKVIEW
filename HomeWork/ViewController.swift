//
//  ViewController.swift
//  HomeWork
//
//  Created by mohammad.alsharif on 03/04/1443 AH.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var mainCollectionView: UICollectionView!
    @IBOutlet weak var greenCollectionView: UICollectionView!
    @IBOutlet weak var redCollectionView: UICollectionView!
    
    var array = ["🟢", "🔴", "🟢", "🔴", "🟢", "🔴", "🟢", "🔴", "🟢", "🔴", "🟢", "🔴", "🟢", "🔴", "🟢", "🔴", "🟢", "🔴", "🟢", "🔴", "🟢", "🔴", "🟢", "🔴", "🟢", "🔴", "🟢", "🔴", "🟢", "🔴", "🟢", "🔴", "🟢", "🔴", "🟢", "🔴", "🟢", "🔴", "🟢", "🔴", "🟢", "🔴"]
    var greenArray = [String]()
    var redArray = [String]()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == mainCollectionView {
            return array.count
        } else if (collectionView == greenCollectionView ) {
            return greenArray.count
        } else {
            return redArray.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == mainCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath) as! CollectionViewCell
            cell.lbl.text = array[indexPath.row]
            
            return cell
            
        } else if collectionView == greenCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID2", for: indexPath) as! CollectionView2
            cell.layer.cornerRadius = 25
            cell.lbl2.text = greenArray[indexPath.row]
            return cell
            
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID3", for: indexPath) as! CollectionView3
            cell.layer.cornerRadius = 25
            cell.lbl3.text = redArray[indexPath.row]

            return cell
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView == mainCollectionView {
            
            if array[indexPath.row] == "🟢" {
                greenArray.append("🟢")
                greenCollectionView.reloadData()
                mainCollectionView.reloadData()
                array.remove(at: indexPath.row)

            } else  {
                redArray.append("🔴")
                redCollectionView.reloadData()
                mainCollectionView.reloadData()
                array.remove(at: indexPath.row)

            }
            
       } else if (collectionView == greenCollectionView ) {
           
            if array[indexPath.row] == "🟢" {
                greenArray.append("🟢" )
                collectionView.reloadData()
            } else {
                greenArray.append("🔴")
                redCollectionView.reloadData()
            }
            
        } else {
            
            greenArray.append("🔴")
            redCollectionView.reloadData()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainCollectionView.delegate = self
        mainCollectionView.dataSource = self
        
        greenCollectionView.delegate = self
        greenCollectionView.dataSource = self
        
        redCollectionView.delegate = self
        redCollectionView.dataSource = self
        
        array.shuffle()
        
    }

}

