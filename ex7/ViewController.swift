//

import UIKit

class ViewController: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource{
    var arryysunskys: [Int] = []
    var arrymoonskys: [Int] = []
    var mainarryskys: [Int] = []
    
    @IBOutlet weak var firstColletionView: UICollectionView!
    @IBOutlet weak var secondCollectionView: UICollectionView!
    @IBOutlet weak var thirdCollectionView: UICollectionView!
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if  collectionView == firstColletionView {
            return mainarryskys.count
        }else if collectionView == secondCollectionView {
            return arrymoonskys.count
        }else {
            return arryysunskys.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == firstColletionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellD", for: indexPath) as! myCollectionViewCell
            if (mainarryskys[indexPath.row] == 0) {
                cell.title.text = "🌞"
            } else {
                cell.title.text = "🌚"
            }
            return cell
        } else if collectionView == secondCollectionView {
            let oreangleft = collectionView.dequeueReusableCell(withReuseIdentifier: "leftballs", for: indexPath) as! myCollectionViewCell
            oreangleft.orange.text = "🌚"
            return oreangleft
            
        } else {
            let yellowright = collectionView.dequeueReusableCell(withReuseIdentifier: "rightballs", for: indexPath) as! myCollectionViewCell
            yellowright.yellow.text = "🌞"
            return yellowright
        }
        
    }
    
    
    //
    //    let balls = Int.random(in: 0...1)
    //            if( == 0){
    //
    //              cell.title.text = ""
    //              arryOrangeboolt.append(indexPath.row)
    //              print("yellow", arryOrangeboolt)
    //            }else{
    //              cell.title.text = ""
    //              arryyellowboolt.append(indexPath.row)
    //              print("Orange", arryyellowboolt)
    //            }
    //            return cell
    //    }
    //
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView == firstColletionView {
            if (mainarryskys[indexPath.row] == 0) {
                arrymoonskys.append(mainarryskys[indexPath.row])
                mainarryskys.remove(at: indexPath.row)
            } else {
                arryysunskys.append(mainarryskys[indexPath.row])
                mainarryskys.remove(at: indexPath.row)
            }
        } else if collectionView == secondCollectionView {
            mainarryskys.append(arrymoonskys[indexPath.row])
            arrymoonskys.remove(at: indexPath.row)
         
            
        }else {
            mainarryskys.append(arryysunskys[indexPath.row])
            arryysunskys.remove(at: indexPath.row)
        }
        
        firstColletionView.reloadData()
        secondCollectionView.reloadData()
        thirdCollectionView.reloadData()

    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstColletionView.delegate = self
        firstColletionView.dataSource = self
        secondCollectionView.delegate = self
        secondCollectionView.dataSource = self
        thirdCollectionView.delegate = self
        thirdCollectionView.dataSource = self
        
        // Do any additional setup after loading the view.
        
        for _ in 0...59{
            
            let skys = Int.random(in: 0...1)
            mainarryskys.append(skys)
        }
    }
    
}
