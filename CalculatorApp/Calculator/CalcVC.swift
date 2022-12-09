//
//  ViewController.swift
//  Calculator
//
//  Created by Dante Ausonio on 12/7/22.
//

import UIKit

class CalcVC: UIViewController {
    
    @IBOutlet weak var CalcInputs: UILabel!
    @IBOutlet weak var CalcResults: UILabel!
    
    var input: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clearAll()
    }
    
    func clearAll() {
        input = ""
        CalcInputs.text = ""
        CalcResults.text = ""
    }
    
    
    @IBAction func allClearTap(_ sender: Any) {
        clearAll()
    }
    
    @IBAction func deleteTap(_ sender: Any) {
        input.removeLast()
        CalcInputs.text = input
    }
    
    func addToInput(value: String) {
        if CalcInputs.text == "ERROR" {
            CalcInputs.text = ""
        }
        input = input + value
        CalcInputs.text = input
    }
    
    @IBAction func percentTap(_ sender: Any) {
        addToInput(value: "%")
    }
    
    @IBAction func divideTap(_ sender: Any) {
        addToInput(value: "/")
    }
    
    @IBAction func multiplyTap(_ sender: Any) {
        addToInput(value: "*")
    }
    
    @IBAction func subtractTap(_ sender: Any) {
        addToInput(value: "-")
    }
    
    @IBAction func addTap(_ sender: Any) {
        addToInput(value: "+")
    }
    
    @IBAction func equalsTap(_ sender: Any) {
        
        if (validInput()) {
            let checkedInputForPercent = input.replacingOccurrences(of: "%", with: "*0.01")
            let expression = NSExpression(format: checkedInputForPercent)
             let result = expression.expressionValue(with: nil, context: nil) as! Double
            let resultString = formatResult(result: result)
            CalcResults.text = resultString
        } else {
            input = ""
            CalcInputs.text = "ERROR"
        }
    }
    
    func validInput() -> Bool {
        var count = 0
        var funcCharIndexes = [Int]()
        
        for char in input {
            if (specialCharacter(char: char)) {
                funcCharIndexes.append(count)
            }
            count += 1
        }
        
        var previous: Int = -1
        
        for index in funcCharIndexes {
            if index == 0 {
                return false
            }
            
            if (index == input.count - 1) {
                return false
            }
            
            if previous != -1 {
                if (index - previous == 1) {
                    return false
                }
            }
            previous = index
        }
        
        if CalcInputs.text == "ERROR" {
            return false
        }
        
        return true
         
    }
    
    func specialCharacter(char: Character) -> Bool {
        if (char == "*") {
            return true
        }
        if (char == "/") {
            return true
        }
        if (char == "+") {
            return true
        }
        if (char == "-") {
            return true
        }
        return false
    }
    
    func formatResult(result: Double) -> String {
        if result.truncatingRemainder(dividingBy: 1) == 0 {
            return String(format: "%.0f", result)
        } else {
            return String(format: "%0.2f", result)
        }
    }
    
    @IBAction func decimalTap(_ sender: Any) {
        addToInput(value: ".")
    }
    
    @IBAction func zeroTap(_ sender: Any) {
        addToInput(value: "0")
    }
    
    @IBAction func oneTap(_ sender: Any) {
        addToInput(value: "1")
    }
    
    @IBAction func twoTap(_ sender: Any) {
        addToInput(value: "2")
    }
    
    @IBAction func threeTap(_ sender: Any) {
        addToInput(value: "3")
    }
    
    @IBAction func fourTap(_ sender: Any) {
        addToInput(value: "4")
    }
    
    @IBAction func fiveTap(_ sender: Any) {
        addToInput(value: "5")
    }
    
    @IBAction func sixTap(_ sender: Any) {
        addToInput(value: "6")
    }
    
    @IBAction func sevenTap(_ sender: Any) {
        addToInput(value: "7")
    }
    
    @IBAction func eightTap(_ sender: Any) {
        addToInput(value: "8")
    }
    
    @IBAction func nineTap(_ sender: Any) {
        addToInput(value: "9  ")
    }
    
    
    @IBAction func unwindSegue(_ segue: UIStoryboardSegue) {}
    
}

