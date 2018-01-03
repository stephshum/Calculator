//
//  ViewController.swift
//  Calculator
//
//  Created by Stephanie Shum on 8/26/17.
//  Copyright © 2017 Stephanie Shum. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var lastOperation: String?
    var firstNumber: Float = 0.0
    var secondNumber: Float?
    var newNumber: Bool = false
    var equalsLastPressed = false
    var secondPercent: Float?
    
    @IBOutlet weak var resultsLabel: UILabel!
    @IBOutlet weak var divideButton: UIButton!
    @IBOutlet weak var multiplyButton: UIButton!
    @IBOutlet weak var subtractButton: UIButton!
    @IBOutlet weak var addButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultsLabel.text = "0"
    }
    
    
    @IBAction func decimalButton(_ sender: UIButton) {
        if equalsLastPressed == true {
            lastOperation = nil
            firstNumber = 0.0
            secondNumber = nil
            newNumber = false
            resultsLabel.text = "0"
            divideButton.layer.borderWidth = 0
            multiplyButton.layer.borderWidth = 0
            subtractButton.layer.borderWidth = 0
            addButton.layer.borderWidth = 0
            secondPercent = nil
            equalsLastPressed = false
        }
        if resultsLabel.text == "0" {
            resultsLabel.text = "0."
        } else if lastOperation == nil{
            if resultsLabel!.text!.range(of: ".") == nil {
                resultsLabel.text = resultsLabel.text! + sender.titleLabel!.text!
                firstNumber = Float(resultsLabel.text!)!
            } else {
                
            }
        } else if newNumber == false {
                resultsLabel.text = "0."
                secondNumber = Float(sender.titleLabel!.text!)
                newNumber = true
                if divideButton.layer.borderWidth == 1 {
                    divideButton.layer.borderWidth = 0
                } else if multiplyButton.layer.borderWidth == 1 {
                    multiplyButton.layer.borderWidth = 0
                } else if subtractButton.layer.borderWidth == 1 {
                    subtractButton.layer.borderWidth = 0
                } else if addButton.layer.borderWidth == 1 {
                    addButton.layer.borderWidth = 0
                }
        } else {
            if resultsLabel!.text!.range(of: ".") == nil {
                resultsLabel.text = resultsLabel.text! + sender.titleLabel!.text!
                secondNumber = Float(resultsLabel.text!)
            } else {
                }
        }
    }
    
    
    @IBAction func numberButtonPressed(_ sender: UIButton) {
        if equalsLastPressed == true {
            lastOperation = nil
            firstNumber = 0.0
            secondNumber = nil
            newNumber = false
            resultsLabel.text = "0"
            divideButton.layer.borderWidth = 0
            multiplyButton.layer.borderWidth = 0
            subtractButton.layer.borderWidth = 0
            addButton.layer.borderWidth = 0
            secondPercent = nil
            equalsLastPressed = false
        }
        if resultsLabel.text == "0" && sender.titleLabel!.text! == "0"{
        } else if lastOperation == nil {
            if firstNumber == 0.0 && resultsLabel.text == "0" {
                resultsLabel.text = sender.titleLabel!.text!
                firstNumber = Float(resultsLabel.text!)!
            } else {
                resultsLabel.text = resultsLabel.text! + sender.titleLabel!.text!
                firstNumber = Float(resultsLabel.text!)!
            }

        } else if newNumber == false {
            resultsLabel.text = sender.titleLabel!.text!
            secondNumber = Float(sender.titleLabel!.text!)
            newNumber = true
            if divideButton.layer.borderWidth == 1 {
                divideButton.layer.borderWidth = 0
            } else if multiplyButton.layer.borderWidth == 1 {
                multiplyButton.layer.borderWidth = 0
            } else if subtractButton.layer.borderWidth == 1 {
                subtractButton.layer.borderWidth = 0
            } else if addButton.layer.borderWidth == 1 {
                addButton.layer.borderWidth = 0
            }
            
        } else {
            if secondNumber == 0.0 && resultsLabel.text == "0"{
                resultsLabel.text = sender.titleLabel!.text!
                secondNumber = Float(resultsLabel.text!)
            } else {
                resultsLabel.text = resultsLabel.text! + sender.titleLabel!.text!
                secondNumber = Float(resultsLabel.text!)
            }
        }
    }
    
    

    
    @IBAction func clearButton(_ sender: UIButton) {
        lastOperation = nil
        firstNumber = 0.0
        secondNumber = nil
        newNumber = false
        resultsLabel.text = "0"
        divideButton.layer.borderWidth = 0
        multiplyButton.layer.borderWidth = 0
        subtractButton.layer.borderWidth = 0
        addButton.layer.borderWidth = 0
        secondPercent = nil
        equalsLastPressed = false

    }
    
    @IBAction func equalsButton(_ sender: UIButton) {
        if secondPercent != nil {
            resultsLabel.text = String(secondPercent!)
            firstNumber = Float(resultsLabel.text!)!
            newNumber = false
            equalsLastPressed = true
        } else {
            if (secondNumber == nil && lastOperation == nil) {
                equalsLastPressed = true
            } else if secondNumber == nil {
                if lastOperation! == "÷" {
                    resultsLabel.text = String(firstNumber / firstNumber)
                } else if lastOperation! == "×" {
                    resultsLabel.text = String(firstNumber * firstNumber)
                } else if lastOperation! == "-" {
                    resultsLabel.text = String(firstNumber - firstNumber)
                } else {
                    resultsLabel.text = String(firstNumber + firstNumber)
                }
                firstNumber = Float(resultsLabel.text!)!
                newNumber = false
                equalsLastPressed = true
            } else {
                if lastOperation! == "÷" {
                    resultsLabel.text = String(firstNumber / secondNumber!)
                } else if lastOperation! == "×" {
                    resultsLabel.text = String(firstNumber * secondNumber!)
                } else if lastOperation! == "-" {
                    resultsLabel.text = String(firstNumber - secondNumber!)
                } else {
                    resultsLabel.text = String(firstNumber + secondNumber!)
                }
                firstNumber = Float(resultsLabel.text!)!
                newNumber = false
                equalsLastPressed = true
            }
        }

        
    }
    

    @IBAction func negateButton(_ sender: UIButton) {
        if (newNumber == false) {
        
            if resultsLabel.text == "0" {
                
            } else {
                if Float(resultsLabel!.text!)! > 0.0 {
                    resultsLabel.text = "-" + resultsLabel.text!
                    firstNumber = -firstNumber
                } else {
                    resultsLabel.text = resultsLabel.text?.replacingOccurrences(of:"-", with: "")
                    firstNumber = -firstNumber
                }
            }
        } else {
            if Float(resultsLabel!.text!)! > 0.0 {
                resultsLabel.text = "-" + resultsLabel.text!
                secondNumber = -secondNumber!
            } else {
                resultsLabel.text = resultsLabel.text?.replacingOccurrences(of:"-", with: "")
                secondNumber = -secondNumber!
            }
        }
    }
    
    @IBAction func percentButton(_ sender: UIButton) {
        if (newNumber == false) {
            if resultsLabel.text == "0" {
            } else {
                firstNumber = firstNumber/100
                resultsLabel.text = String(firstNumber)
            }
        } else {
            if lastOperation! == "×" {
                secondPercent = firstNumber * (firstNumber * secondNumber! / 100)
                resultsLabel.text = String(firstNumber * secondNumber! / 100)
            } else if lastOperation! == "-" {
                secondPercent = firstNumber - (firstNumber * secondNumber! / 100)
                resultsLabel.text = String(firstNumber * secondNumber! / 100)
            } else if lastOperation! == "+"{
                secondPercent = firstNumber + (firstNumber * secondNumber! / 100)
                resultsLabel.text = String(firstNumber * secondNumber! / 100)
            } else {
                secondPercent = firstNumber / (firstNumber * secondNumber! / 100)
                resultsLabel.text = String(firstNumber * secondNumber! / 100)

            }
        }
    }
    
    
    @IBAction func operationButton(_ sender: UIButton) {
        if sender.titleLabel!.text! == "÷" {
            lastOperation = "÷"
        } else if sender.titleLabel!.text! == "×" {
            lastOperation = "×"
        } else if sender.titleLabel!.text! == "-" {
            lastOperation = "-"
        } else {
            lastOperation = "+"
        }
        sender.layer.borderWidth = 1
        equalsLastPressed = false
    }

    
    

    
    
}

