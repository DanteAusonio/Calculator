//
//  VectorVCViewController.swift
//  Calculator
//
//  Created by Dante Ausonio on 12/7/22.
//

import UIKit

class VectorVC: UIViewController {

    
    @IBOutlet weak var OperatorTxt: UILabel!
    @IBOutlet weak var ResultTxt: UILabel!
    @IBOutlet weak var InputAi: UITextField!
    @IBOutlet weak var InputAj: UITextField!
    @IBOutlet weak var InputAk: UITextField!
    @IBOutlet weak var InputBi: UITextField!
    @IBOutlet weak var InputBj: UITextField!
    @IBOutlet weak var InputBk: UITextField!
    
    
    
    
    
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
    }
   
    @IBAction func CrossProductBtn(_ sender: Any) {
        OperatorTxt.text = "   x"
    }
    
    @IBAction func DotProductBtn(_ sender: Any) {
        OperatorTxt.text = "   *"
    }
    
    @IBAction func PlusBtn(_ sender: Any) {
        OperatorTxt.text = "   +"
    }
    
    @IBAction func MinusBtn(_ sender: Any) {
        OperatorTxt.text = "   -"
    }
    
    @IBAction func AllClearBtn(_ sender: Any) {
        ResultTxt.text = ""
        OperatorTxt.text = ""
        InputAi.text = ""
        InputAj.text = ""
        InputAk.text = ""
        InputBi.text = ""
        InputBj.text = ""
        InputBk.text = ""
    }
    
    
    
    
    @IBAction func EqualsBtn(_ sender: Any) {
        let vectors = makeVectors()
        if let vectA = vectors.0 {
            if let vectB = vectors.1 {
                
            switch OperatorTxt.text {
                case "   x":
                    let result: vector = crossProduct(A: vectA, B: vectB)
                    ResultTxt.text = result.text()
                case "   *":
                    let result: Double = dotProduct(A: vectA, B: vectB)
                    ResultTxt.text = String(result)
                case "   +":
                    let result: vector = addVectors(A: vectA, B: vectB)
                    ResultTxt.text = result.text()
                case "   -":
                    let result: vector = subtractVectors(A: vectA, B: vectB)
                    ResultTxt.text = result.text()
                default:
                    ResultTxt.text = "ERROR"
            }
            
            
                
            } else {
                ResultTxt.text = "ERROR"
            }
        } else {
            ResultTxt.text = "ERROR"
        }
    }
    
    func makeVectors() -> (vector?, vector?) {
        if let Ai: Double = Double(InputAi.text!), let Aj: Double = Double(InputAj.text!), let Ak: Double = Double(InputAk.text!), let Bi: Double = Double(InputBi.text!), let Bj: Double = Double(InputBj.text!), let Bk: Double = Double(InputBk.text!)
        {
            let A = vector(i: Ai, j: Aj, k: Ak)
            let B = vector(i: Bi, j: Bj, k: Bk)
            return (A, B)
        }
        return (nil,nil)
    }
    
    
    func crossProduct(A: vector, B: vector) -> vector {
        let Ci = (A.j * B.k) - (A.k * B.j)
        let Cj = (A.i * B.k) - (A.k * B.i)
        let Ck = (A.i * B.j) - (A.j * B.i)
        let C = vector(i: Ci, j: -Cj, k: Ck)
        return C
    }
    
    
    func dotProduct(A: vector, B: vector) -> Double {
        let result: Double = (A.i * B.i) + (A.j * B.j) + (A.k * B.k)
        return result
    }
    
    
    func addVectors (A: vector, B: vector) -> vector {
        let Ci = A.i + B.i
        let Cj = A.j + B.j
        let Ck = A.k + B.k
        let C = vector(i: Ci, j: Cj, k: Ck)
        return C
    }
    
    
    func subtractVectors(A: vector, B: vector) -> vector {
        let Ci = A.i - B.i
        let Cj = A.j - B.j
        let Ck = A.k - B.k
        let C = vector(i: Ci, j: Cj, k: Ck)
        return C
    }
    
    
    

}
