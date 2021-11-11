import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var arrMain : [Int] = []
    var arrBlue : [Int] = []
    var arrRed : [Int] = []
    
    @IBOutlet weak var CVMain: UICollectionView!
    @IBOutlet weak var CVRed: UICollectionView!
    @IBOutlet weak var CVBlue: UICollectionView!
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (collectionView == CVMain){
            return arrMain.count
        }else if (CVBlue == collectionView ){
            return arrBlue.count
        }else if (CVRed == collectionView){
            return arrRed.count
        }else {
            return arrMain.count
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CVMain.delegate = self
        CVMain.dataSource = self
        CVRed.delegate = self
        CVRed.dataSource = self
        CVBlue.delegate = self
        CVBlue.dataSource = self
        
        
        for n in 0...30 {
            arrMain.append(n)
        }
        
        
        //            CVBlue.register(myCellBlue.self, forCellReuseIdentifier: "myCellBlue")
        //        CVBlue.register(BlueCollectionCell.self, forCellWithReuseIdentifier: "myCellBlue")
        //            CVRed.register(myCellRed.self,  forCellReuseIdentifier: "myCellRed")
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
//        print (collectionView)
        
        if (collectionView == CVMain) {
            let cell = CVMain.dequeueReusableCell(withReuseIdentifier: "myMainCell", for: indexPath) as! CellOne
            cell.myMainCellLabel.text = String(arrMain[indexPath.row])
            
            if indexPath.row % 2 == 0 {
                cell.backgroundColor = .blue
                // try return in condetion
//            } else if indexPath.row % 2 != 0 {
            } else {
                cell.backgroundColor = .red
                cell.layer.cornerRadius = 24
                
            }
            
            //            cell.backgroundColor = .red
            //            cell.layer.cornerRadius = 24
            return cell
        }
        
        else if (collectionView == CVBlue ) {
            let cell = CVBlue.dequeueReusableCell(withReuseIdentifier: "myCellBlue", for: indexPath) as! BlueCollectionCell
            let cred = arrBlue[indexPath.row]
            cell.myCellBlue.text = String(cred)
            return cell
        }
        else {
            let cell = CVRed.dequeueReusableCell(withReuseIdentifier: "myCellRed", for: indexPath) as! RedCollectionCell
            let cred = arrRed[indexPath.row]
            print(arrRed[indexPath.row])
//            cell.myCellRed.text = String(cred)
            cell.testLbl.text = String(cred)
            

            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        //        if (collectionView == CVMain) {
        //            let tappedNumber = arrMain[indexPath.row]
        //            if tappedNumber % 2 == 0 {
        //                arrBlue.append(tappedNumber)
        //                arrMain.remove(at: indexPath.row)
        //            } else {
        //
        //            }
        if (collectionView == CVMain) {
            let tappedNumber = arrMain[indexPath.row]
            if tappedNumber % 2 == 0 {
                print(indexPath.row)
                arrRed.append(tappedNumber)
                arrMain.remove (at: indexPath.row)
            }else{
                arrBlue.append(tappedNumber)
                arrMain.remove(at: indexPath.row)
            }
            
        }else if (collectionView == CVBlue){
            arrBlue.remove (at: indexPath.row)
            arrMain.append(arrBlue[indexPath.row])
        } else {
            arrMain.append(arrRed[indexPath.row])
            arrRed.remove(at: indexPath.row)
        }
        
        CVMain.reloadData()
        CVRed.reloadData()
        CVBlue.reloadData()
    }
}



class BlueCollectionCell: UICollectionViewCell {
    @IBOutlet weak var myCellBlue: UILabel!
    
}

class RedCollectionCell : UICollectionViewCell {
//    @IBOutlet weak var myCellRed: UILabel!
    @IBOutlet weak var testLbl: UILabel!
    
}

class CellOne :UICollectionViewCell {
    
    @IBOutlet weak var myMainCellLabel: UILabel!
    
}
