//
//  ViewController.swift
//  CVhomework
//
//  Created by Nojoud Mohaimmed on 04/04/1443 AH.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    var arrayMain = [Int] ()
    var arrayBlue = [Int] ()
    var arrayRed = [Int] ()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == mainCV {
            return arrayMain.count
        }else if collectionView == redCollection {
            return arrayRed.count
        }else{
            return arrayBlue.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == redCollection {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "redID", for: indexPath)as! mainCollectionCell
            cell.redCell.text = "🔴"
            return cell
        }else if collectionView == mainCV {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mainCell", for: indexPath)as! mainCollectionCell
            if (arrayMain [indexPath.row] == 0 ){
                cell.firstCell.text = "🔴"
                return cell
            }else{
                cell.firstCell.text = "🔵"
                return cell
            }
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BlueID", for: indexPath)as! mainCollectionCell
            cell.blueCell.text = "🔵"
            return cell
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == mainCV {
            print ("indexpath : \( indexPath.row) main array : \(arrayMain[indexPath.row]) " )
            if (arrayMain[indexPath.row] == 0){
            arrayRed.append(arrayMain[indexPath.row])
            arrayMain.remove(at: indexPath.row)
            } else {
            arrayBlue.append(arrayMain[indexPath.row])
            arrayMain.remove(at: indexPath.row)
            }
        }else if collectionView == redCollection{
            arrayMain.append(arrayRed[indexPath.row])
            arrayRed.remove(at: indexPath.row)
           
        }else{
            arrayMain.append(arrayBlue[indexPath.row])
            arrayBlue.remove(at: indexPath.row)
        }
        mainCV.reloadData()
        redCollection.reloadData()
        blueCollection.reloadData()
    }
    @IBOutlet weak var mainCV: UICollectionView!
    
    @IBOutlet weak var blueCollection: UICollectionView!
    
    @IBOutlet weak var redCollection: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        mainCV.delegate = self
        mainCV.dataSource = self
        blueCollection.delegate = self
        blueCollection.dataSource = self
        redCollection.delegate = self
        redCollection.dataSource = self
        
        for _ in 0 ... 24 {
            arrayMain.append(Int.random(in: 0...1))
        }
    }
}
