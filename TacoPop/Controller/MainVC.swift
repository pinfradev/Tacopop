//
//  MainVC.swift
//  TacoPop
//
//  Created by Fray Pineda on 10/22/18.
//  Copyright © 2018 Fray Pineda. All rights reserved.
//

import UIKit

class MainVC: UIViewController, dataServiceDelegate {
    @IBOutlet weak var headerView: HeaderView!
    @IBOutlet weak var CollectionView: UICollectionView!
    
    var ds: DataService = DataService.instance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ds.loadDeliciousTacoData()
        ds.tacoArray =  ds.tacoArray.shuffled() //randomize our array
        headerView.addDropShadow()
        ds.delegate = self
        CollectionView.delegate = self
        CollectionView.dataSource = self
        
        /*let nib = UINib(nibName: "TacoCell", bundle: nil)
        CollectionView.register(nib, forCellWithReuseIdentifier: "TacoCell")*/
        //La anterior es la vieja forma de hacerlo otra es en el codigo de la celda se usa protocolo NibLoadable
        
        CollectionView.register(TacoCell.self)
    }
    
    func deliciousTacoDataLoaded() {
        print("Delicious Taco Data Loaded!")
        CollectionView.reloadData()
        /*Cuando se este cargando data de un servidor se puede poner un spinner y cuando ya se cargue entonces se quita el spinner y se le puede dar reload o algo aqui no hay problema porque todo es local*/
    }

 

}

extension MainVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ds.tacoArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
     
//        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TacoCell", for: indexPath) as? TacoCell
//        {
//           cell.configureCell(taco: ds.tacoArray[indexPath.row])
//            return cell
//        }
//        return UICollectionViewCell()
// Otra forma de hacerlo
        
        let cell = collectionView.dequeueReusableCell(forIndexPath: indexPath) as TacoCell
        cell.configureCell(taco: ds.tacoArray[indexPath.row])
        return cell
        

    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? TacoCell {
            cell.shake()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 95, height: 95)
    }
}
