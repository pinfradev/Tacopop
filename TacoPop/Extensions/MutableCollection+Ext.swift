//
//  MutableCollection+Ext.swift
//  TacoPop
//
//  Created by Fray Pineda on 10/23/18.
//  Copyright © 2018 Fray Pineda. All rights reserved.
//

import Foundation

extension MutableCollection where Index == Int { // Solo va a funcionar cuando el index sea entero
    mutating func shuffle() {
        if count < 2{return}
        
        for i in startIndex ..< endIndex - 1 {
            let j = Int(arc4random_uniform(UInt32(endIndex - i))) + i
            guard i != j else { continue}
            self.swapAt(i, j) // el & es porque es mutating function y usa inout parameters & significa una referencia
        }
    }
}
