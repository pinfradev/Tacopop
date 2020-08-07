//
//  DropShadow.swift
//  TacoPop
//
//  Created by Fray Pineda on 10/22/18.
//  Copyright © 2018 Fray Pineda. All rights reserved.
//

import UIKit

protocol DropShadow {}

extension DropShadow where Self: UIView { // el self es como para poner el tipo del que es el protocolo
    func addDropShadow() {
        //implementation
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.7
        layer.shadowOffset = CGSize.zero
        layer.shadowRadius = 5
    }
}
