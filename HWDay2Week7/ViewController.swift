//
//  ViewController.swift
//  HWDay2Week7



import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource{
    
    var arryColors: [Int] = []
    var selctedBlueBall: [Int] = []
    var selctedRedBall: [Int] = []
   
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == cvMain {
            return arryColors.count
            
        }else if collectionView == blueCollection {
            return selctedBlueBall.count
        } else {
            return selctedRedBall.count
        }
       
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if cvMain == collectionView{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath) as! CustomCell

        
            if (arryColors[indexPath.row] == 0 ){
        cell.title.text = "🔵"
           
        }else if(arryColors[indexPath.row] == 1) {
        cell.title.text = "🔴"
          
        }
        return cell
        } else if blueCollection == collectionView {
            let blue = collectionView.dequeueReusableCell(withReuseIdentifier: "cellBlue", for: indexPath) as! CustomCell
            blue.blueT.text = "🔵"
            return blue
        }else {
            let red = collectionView.dequeueReusableCell(withReuseIdentifier: "cellRed", for: indexPath) as! CustomCell
            red.redT.text = "🔴"
            return red
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == cvMain {
       
            if (arryColors[indexPath.row] == 0) {
            arryColors.remove(at: indexPath.row)
            selctedBlueBall.append(0)
        }else{
            arryColors.remove(at: indexPath.row)
            selctedRedBall.append(1)
        }
    } else if collectionView == blueCollection{
        selctedBlueBall.remove(at: indexPath.row)
        arryColors.append(0)
       
    }else {
        selctedRedBall.remove(at: indexPath.row)
        arryColors.append(1)
    }
    cvMain.reloadData()
    blueCollection.reloadData()
    redCollection.reloadData()
}
    @IBOutlet weak var blueCollection: UICollectionView!
    @IBOutlet weak var redCollection: UICollectionView!
    @IBOutlet weak var cvMain: UICollectionView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        cvMain.delegate = self
        cvMain.dataSource = self
        
        blueCollection.delegate = self
        blueCollection.dataSource = self
        
        redCollection.delegate = self
        redCollection.dataSource = self
        
        for _ in 0...29 {
            let balls = Int.random(in: 0...1)
            arryColors.append(balls)
        }
       
        
    }


}


