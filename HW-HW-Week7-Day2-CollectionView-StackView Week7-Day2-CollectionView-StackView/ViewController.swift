//
//  ViewController.swift
//  HW-HW-Week7-Day2-CollectionView-StackView Week7-Day2-CollectionView-StackView
//
//  Created by بندر عبيد ثاري الرشيدي on 03/04/1443 AH.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 60
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID1", for: indexPath) as! CollectionViewCell
        let cell1 = Int.random(in: 0...1)
        var arryBlue: [Int] = []
        var arryRed: [Int] = []
        if (cell1 == 0){
            cell.label1.text = "🌚"
            arryBlue.append(indexPath.row)
            print("Blue",arryBlue)
            
        }else{
            cell.label1.text = "🌝"
            arryRed.append(indexPath.row)
            print("Red",arryRed)
        }
        return cell
    }
//    func tableView(_ tabelView: UITableView, didSelectRowAt indexPath:IndexPath){
//        print(indexPath.row)
//    }
    

    
    @IBOutlet weak var CollectionView11: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        CollectionView11.delegate = self
        CollectionView11.dataSource = self
        
    }
    
    
   
}


