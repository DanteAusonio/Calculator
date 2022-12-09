//
//  File.swift
//  Calculator
//
//  Created by Dante Ausonio on 12/8/22.
//

import Foundation

struct vector {
    var i: Double
    var j: Double
    var k: Double
    
   
    init(i: Double, j: Double, k: Double) {
        self.i = i
        self.j = j
        self.k = k
    }
    
    
    func text() -> String {
        let iTxt: String = String(self.i)
        let jTxt: String = String(self.j)
        let kTxt: String = String(self.k)
        let vectTxt: String = "< \(iTxt), \(jTxt), \(kTxt)>"
        return vectTxt
    }
}
