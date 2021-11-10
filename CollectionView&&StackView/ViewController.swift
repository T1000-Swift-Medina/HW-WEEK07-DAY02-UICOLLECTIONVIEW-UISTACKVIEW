//
//  ViewController.swift
//  CollectionView&&StackView
//
//  Created by Osama folta on 03/04/1443 AH.
//

import UIKit

class ViewController: UIViewController ,UICollectionViewDelegate , UICollectionViewDataSource {
    
    @IBOutlet weak var mainCv: UICollectionView!
    @IBOutlet weak var greenCv: UICollectionView!
    @IBOutlet weak var redCv: UICollectionView!
    var originArray = ["🟢" ,"🔴","🟢" ,"🔴","🟢" ,"🔴","🟢" ,"🔴","🟢" ,"🔴","🟢" ,"🔴","🟢" ,"🔴","🟢" ,"🔴","🟢" ,"🔴","🟢" ,"🔴","🟢" ,"🔴","🟢" ,"🔴","🟢" ,"🔴","🟢" ,"🔴","🟢" ,"🔴","🟢" ,"🔴"]
    var greenArray=[String]()
    var redArray=[String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        mainCv.delegate = self
        mainCv.dataSource = self
        greenCv.delegate = self
        greenCv.dataSource = self
        redCv.delegate = self
        redCv.dataSource = self
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == mainCv
        {return originArray.count}
        
        else if collectionView == greenCv
        {return greenArray.count}
        
        else {return redArray.count}
    }

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == mainCv {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath ) as! mainCVCell
            cell.mainLabel.text = originArray[indexPath.row]
            cell.layer.cornerRadius = 25
            cell.backgroundColor = .black
            return cell

        } else if collectionView == greenCv{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "greenCell", for: indexPath ) as! greenCVcell
            cell.layer.cornerRadius = 25
            cell.backgroundColor = .lightText

            return cell

        } else {
        let cell = redCv.dequeueReusableCell(withReuseIdentifier: "redCell", for: indexPath ) as! redCVcell
            cell.layer.cornerRadius = 25
            cell.backgroundColor = .tertiaryLabel

            return cell
            
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == mainCv  {
                 let cell = mainCv.cellForItem(at: indexPath) as! mainCVCell
                 
            if cell.mainLabel.text == "🟢" {
                     greenArray.append("🟢")
                     originArray.remove(at: indexPath.row)
                     mainCv.reloadData()
                     greenCv.reloadData()
                 } else  {
                         redArray.append("🔴")
                         originArray.remove(at: indexPath.row)
                         mainCv.reloadData()
                     redCv.reloadData()
                 }
        }
        if collectionView == greenCv  {
            
            originArray.append("🟢")
            greenArray.remove(at: indexPath.row)
            mainCv.reloadData()
            greenCv.reloadData()
        }
        
        if collectionView == redCv  {
        
            originArray.append("🔴")
            redArray.remove(at: indexPath.row)
            mainCv.reloadData()
            redCv.reloadData()
        }


               
    }
}

