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
        
        
        for n in 1...50 {
            arrMain.append(n)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        if (collectionView == CVMain) {
            let cell = CVMain.dequeueReusableCell(withReuseIdentifier: "myMainCell", for: indexPath) as! CellOne
            cell.myMainCellLabel.text = String(arrMain[indexPath.row])
            
            if indexPath.row % 2 == 0 {
                cell.backgroundColor = .blue.withAlphaComponent(0.7)
            } else {
                cell.backgroundColor = .red.withAlphaComponent(0.7)
            }
            cell.layer.cornerRadius = 24
            
            return cell
        }
        
        else if (collectionView == CVBlue ) {
            let cell = CVBlue.dequeueReusableCell(withReuseIdentifier: "myCellBlue", for: indexPath) as! BlueCollectionCell
            let cred = arrBlue[indexPath.row]
            cell.myCellBlue.text = String(cred)
            cell.backgroundColor = .white.withAlphaComponent(0.4)
            cell.layer.cornerRadius = 5
            return cell
        }
        else {
            let cell = CVRed.dequeueReusableCell(withReuseIdentifier: "myCellRed", for: indexPath) as! RedCollectionCell
            let cred = arrRed[indexPath.row]
            print(arrRed[indexPath.row])
            cell.testLbl.text = String(cred)
            cell.backgroundColor = .white.withAlphaComponent(0.4)
            cell.testLbl.textColor = .black
            cell.layer.cornerRadius = 5
            return cell
        }
    }

    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        // MARK: Animate all the cells
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.25, initialSpringVelocity: 0.25, options: [.curveEaseInOut, .allowUserInteraction]) {
            cell.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
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
            arrMain.append(arrBlue[indexPath.row])
            arrBlue.remove (at: indexPath.row)
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
    
    @IBOutlet weak var testLbl: UILabel!
    
}

class CellOne :UICollectionViewCell {
    
    @IBOutlet weak var myMainCellLabel: UILabel!
    
}
