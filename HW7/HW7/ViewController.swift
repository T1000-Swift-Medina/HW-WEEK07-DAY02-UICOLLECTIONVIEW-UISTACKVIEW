//
//  ViewController.swift
//  HW7
//
//  Created by العــفاف . on 04/04/1443 AH.
//

import UIKit





class ViewController: UIViewController, UICollectionViewDelegate,UICollectionViewDataSource  {
    
    @IBOutlet weak var CollGreen: UICollectionView!
    @IBOutlet weak var CollBlue: UICollectionView!
    @IBOutlet weak var CollWhait: UICollectionView!
    
    var arrmin: [Int] = []
    var arrBlue: [Int] = []
    var arrGreen: [Int] = []
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
    
        if collectionView == CollWhait {
            return arrmin.count}
        else if collectionView == CollBlue {
            return arrBlue.count}
        else{
            return arrGreen.count}
        
    }
    

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == CollWhait{
    
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath) as! CustomCell
            if (arrmin [indexPath.row] == 0){
            cell.Lable1.text = "👒"
            return cell
        } else {
            cell.Lable1.text = "👗"
            
        }
            return cell
            
        }else if collectionView == CollBlue {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BlueID", for: indexPath) as! CustomCell
            cell.BlueLable.text = "👗"
            return cell
        }else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GreenID", for: indexPath) as! CustomCell
            cell.GreenLable.text = "👒"
            return cell
        }
            
                
        }
        
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == CollWhait{
            print("indexPath:\(indexPath.row) main array : \(arrmin[indexPath.row])")
            if (arrmin[indexPath.row] == 0){
                arrGreen.append(arrmin[indexPath.row])
                arrmin.remove(at: indexPath.row)
               
            } else {
                arrBlue.append(arrmin[indexPath.row])
                arrmin.remove(at: indexPath.row)
                }
            } else if collectionView == CollBlue{
                arrmin.append(arrBlue[indexPath.row])
                arrBlue.remove(at: indexPath.row)
            } else {
                arrmin.append(arrGreen[indexPath.row])
                arrGreen.remove(at: indexPath.row)
            }
        
        CollWhait.reloadData()
        CollBlue.reloadData()
        CollGreen.reloadData()
        
    }
        
    override func viewDidLoad() {
           super.viewDidLoad()
           // Do any additional setup after loading the view
   
        CollGreen.delegate = self
        CollGreen.dataSource = self
        CollBlue.delegate = self
        CollBlue.dataSource = self
        CollWhait.delegate = self
        CollWhait.dataSource = self
        
        for _ in 1...100{
            arrmin.append(Int.random(in: 0...1))
        }
    }
}

    
        
    
        
        
        


    
    
    
    
    
    
    
    
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view
//
//
//}
//
//
    
    
    
    
    
    
    
    
    
//@IBOutlet weak var Blue: UICollectionViewFlowLayout! @IBOutlet weak var Green: UICollectionViewFlowLayout!
//    var ArrayBlue: [Int] = []
//    var ArrayGreen: [Int] = []
//    var ArrayBlueGreen: [Int] = []
//
//
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//
//
//        if collectionView == CV {return 50}
//        else if { collectionView == Blue {return ArrayBlue.count }
//            else do {return Green.count}
//
//
//        }
//
////        let numbers = [0...100]
////        print(numbers)
//
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"cellID" , for: indexPath) as! CustomCell
//        cell.Lable1.text = String(indexPath.row + 1)
//        _ = Int.random(in: 0...1)
//
////        func sortedEvenOddNumbers(_ numbers: [Int]) -> (evens: [Int], odds: [Int]) {
////            var evens = [Int]()
////            var odds = [Int]()
////            for number in numbers {
////                if number % 2 == 0 {
////                    evens.append(number)
////
////        } else {
////                    odds.append(number)
////                }
////        }
////            return (evens, odds)
////        }
////
////        cell.backgroundColor = .systemYellow
////        return cell
////    }
////
////
////
////
////
//
//        weak var CV: UICollectionView!
//
//
//        func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//        CV.delegate = self
//        CV.dataSource = self
//    }
//
//}
//
//
//}
//var ArrayBlue: [Int] = []
//var ArrayGreen: [Int] = []
//var ArrayBG: [Int] = []
//var selectBlue: [Int] = []
//var selectGreen: [Int] = []
//
//func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//    if collectionView == GreenBlue {return 50}
//    else if collectionView == Blue {return ArrayBlue.count}
//    else {return ArrayGreen.count }
//}
//
//func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath)
//return cell }
//
//override func viewDidLoad() {
//    super.viewDidLoad()
//}
//}


//        }
//            if(n as! Int % 2 == 0){
//                print("\(n) is even")
//            }else{nn
//                print("\(n) is odd")
//            }
//        }
//    }
    

