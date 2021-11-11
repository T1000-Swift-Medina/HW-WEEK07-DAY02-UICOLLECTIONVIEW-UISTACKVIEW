//
//  ViewController.swift
//  ex7
//
//  Created by MAC on 03/04/1443 AH.
//

import UIKit

class ViewController: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource{
    
    @IBOutlet weak var firstColletionView: UICollectionView!
    @IBOutlet weak var secondCollectionView: UICollectionView!
    @IBOutlet weak var thirdCollectionView: UICollectionView!
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 60
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellD", for: indexPath) as! myCollectionViewCell
        
    let boolt = Int.random(in: 0...1)
            var arryyellowboolt: [Int] = []
            var arryOrangeboolt: [Int] = []
            var mainarryboolt: [Int] = []
            if(boolt == 0){
                
              cell.title.text = "🟡"
              arryOrangeboolt.append(indexPath.row)
              print("yellow", arryOrangeboolt)
            }else{
              cell.title.text = "🟠"
              arryyellowboolt.append(indexPath.row)
              print("Orange", arryyellowboolt)
            }
            return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        firstColletionView.delegate = self
        firstColletionView.dataSource = self
        // Do any additional setup after loading the view.
    }
    }
