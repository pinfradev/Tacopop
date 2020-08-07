//
//  UIColectionView+Ext.swift
//  TacoPop
//
//  Created by Fray Pineda on 10/23/18.
//  Copyright © 2018 Fray Pineda. All rights reserved.
//

import UIKit

extension UICollectionView {
    // Entonces todas las collectionView del codigo van a tener esta funcionalidad
    
    func register <T: UICollectionViewCell> (_:T.Type) where T: ReusableView, T: NibLoadableView {
    
        let nib = UINib(nibName: T.nibName, bundle: nil)
        register(nib, forCellWithReuseIdentifier: T.reuseIdentifier)
       
    }
    
    func dequeueReusableCell <T:UICollectionViewCell>(forIndexPath indexPath: IndexPath)  ->T where T: ReusableView {
        
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath as IndexPath) as? T else{
            fatalError("Could not dequeue cell with identifier \(T.reuseIdentifier)")
        }
        return cell
        
    }
}

extension UICollectionViewCell: ReusableView{}
