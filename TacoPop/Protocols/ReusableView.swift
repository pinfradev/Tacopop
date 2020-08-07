//
//  ReusableView.swift
//  TacoPop
//
//  Created by Fray Pineda on 10/22/18.
//  Copyright © 2018 Fray Pineda. All rights reserved.
//

import UIKit

protocol ReusableView: class { } // se limita a usar solo en clases

extension ReusableView where Self: UIView {
// Cuando se usa reuseIdentifier toma el nombre de la clase
    
    static var reuseIdentifier: String {
        return String(describing: self)
    }
    
}
