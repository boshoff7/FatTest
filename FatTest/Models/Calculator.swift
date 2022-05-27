//
//  Calculator.swift
//  FatTest
//
//  Created by Chris Boshoff on 2022/05/27.
//

import Foundation
import UIKit

struct Calculator {
    
    var bmi: BMI?
    
    func getBMIValue() -> String {
        let bmiTo1DecimalPlace = String(format: "%.1f", bmi?.value ?? 0.0)
        return bmiTo1DecimalPlace
    }
    
    func getAdvice() -> String {
        return bmi?.advice ?? "No advice"
    }
    
  
    
    mutating func calculateBMI(height: Float, weight: Float) {
       let bmiValue = weight / (height * height)
        
        if bmiValue < 18.5 {
            bmi = BMI(value: bmiValue, advice: "Eat more!")
        } else if bmiValue < 24.9 {
            bmi = BMI(value: bmiValue, advice: "Looking good!")
        } else {
            bmi = BMI(value: bmiValue, advice: "Eat less!")
        }
}
   
    
}
