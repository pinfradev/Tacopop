//
//  NibLoadableView.swift
//  TacoPop
//
//  Created by Fray Pineda on 10/22/18.
//  Copyright © 2018 Fray Pineda. All rights reserved.
//

import UIKit

protocol NibLoadableView: class {}

extension NibLoadableView where Self: UIView { //se limita a usar solo en UIVIew con el where y SELF
    static var nibName: String {
        return String(describing: self) // dice el nombre del NIb a cargar
    }
    
}
