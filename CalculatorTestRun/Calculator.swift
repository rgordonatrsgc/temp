//
//  Calculator.swift
//  CalculatorTestRun
//
//  Created by Russell Gordon on 4/27/17.
//  Copyright © 2017 Russell Gordon. All rights reserved.
//

import Foundation

class Calculator {
    
    // MARK: Properties
    var newValue : String = ""
    var currentValue : Double? = nil
    
    let multiplication = "Multiplication"
    let division = "Division"
    let addition = "Addition"
    let subtraction = "Subtraction"
    let percentage = "Percentage"
    
    var currentOperation : String? = nil
    
    // MARK: Initializer(s)
    
    // MARK: Method(s) a.k.a. Function(s)
    func addToNewValue(digit : String) {
        self.newValue += digit
    }
    
    func multiply() {
        
        // Set the operation
        currentOperation = multiplication
        
        updateState()
    }
    
    func divide() {
        
        // Set the operation
        currentOperation = division

        updateState()
    }
    
    func add() {
        
        // Set the operation
        currentOperation = addition
        
        updateState()
    }

    func subtract() {
        
        // Set the operation
        currentOperation = subtraction
        
        updateState()
    }
    
    func percent() {
        
        // Set the operation
        currentOperation = percentage
        
        // Get the value provided if one was provided
        if newValue != "" {
            makeNewValueCurrentValue()
        }
        
        // Calculate the percentage
        equals()
    }


    func updateState() {
        
        // Set the state of the calculator as appropriate
        if currentValue == nil {
            
            // If new value is first value entered, it becomes currentValue right away
            // and no operation is performed
            makeNewValueCurrentValue()
            
        } else {
            
            // 1. There is a non-nil current value
            if newValue != "" {
                // 2. There is a new value as well
                equals()    // Perform the operation
            } else {
                // 2. There is no new value yet, just an operation logged, so do nothing
            }
            
        }
        
    }
    
    func equals() {
        
        // Perform the selected operation so long as there is a current value to operate on
        if currentValue != nil {
            
            // 1. It's safe to force unwrap currentValue, as we've checked that it does not contain a nil
            // 2. It's OK to force unwrap the creation of a Double from newValue, as we know what
            //    that string contains, since our logic created the string... it will always be
            //    something that can be represented as a Double
            if currentOperation == multiplication {
                currentValue = currentValue! * Double(newValue)!
            } else if currentOperation == division {
                currentValue = currentValue! / Double(newValue)!
            } else if currentOperation == addition {
                currentValue = currentValue! + Double(newValue)!
            } else if currentOperation == subtraction {
                currentValue = currentValue! - Double(newValue)!
            } else if currentOperation == percentage {
                currentValue = currentValue! / Double(100)
            }
        }
        
        
        // The operation selected had been performed, so get ready to receive new operation
        // and new value
        currentOperation = nil
        newValue = ""
        
    }
    
    func clear() {
        
        // Reset everthing
        currentOperation = nil
        newValue = ""
        currentValue = nil
    }
    
    func makeNewValueCurrentValue() {
        
        currentValue = Double(newValue)
        newValue = ""
    }
    
    func changeSign() {
        
        // First operate on the new value ...
        if newValue != "" {
            if newValue.contains("-") {
                // When negative, make positive by removing the negative sign at the start of the string
                newValue.remove(at: newValue.startIndex)
            } else {
                // When positive, make negative by adding the negative sign at the start of the string
                newValue.insert("-", at: newValue.startIndex)
            }
            
        } else {
            // ...otherwise change the value of the current value stored by the calculator
            if currentValue != nil {
                currentValue = currentValue! * -1
            }
        }
        
    }
}
