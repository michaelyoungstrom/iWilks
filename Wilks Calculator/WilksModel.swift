//
//  WilksModel.swift
//  Wilks Calculator
//
//  Created by Mike Youngstrom on 5/4/16.
//  Copyright © 2016 youngstromDevelopment. All rights reserved.
//

import Foundation

class WilksModel{
    
    private var wilksTotal = 0.0
    
    func calculateWilks(unit: Int, gender: Int, bodyweight: Double, weightLifted: Double){
        
        var tempBodyweight = bodyweight
        var tempWeightLifted = weightLifted
        
        //since the formula is for kgs, convert lbs to kgs
        if (unit == 0){
            tempBodyweight = tempBodyweight * 0.453592;
            tempWeightLifted = tempWeightLifted * 0.453592;
        }
        
        var a: Double
        var b: Double
        var c: Double
        var d: Double
        var e: Double
        var f: Double
        
        //set coefficients based on gender
        if gender == 0 {
            a = -216.0475144
            b = 16.2606339
            c = -0.002388645
            d = -0.00113732
            e = 7.01863 * pow(10,-6)
            f = -1.291 * pow(10,-8)
        } else {
            a = 594.31747775582
            b = -27.23842536447
            c = 0.82112226871
            d = -0.00930733913
            e = 0.00004731582
            f = -0.00000009054
        }
        
        let arg1 = a
        let arg2 = b * tempBodyweight
        let arg3 = c * pow(tempBodyweight, 2)
        let arg4 = d * pow(tempBodyweight, 3)
        let arg5 = e * pow(tempBodyweight, 4)
        let arg6 = f * pow(tempBodyweight, 5)
        
        let wilksCoefficient = 500 / (arg1 + arg2 + arg3 + arg4 + arg5 + arg6)
        
        let wilksPreRounding = tempWeightLifted * wilksCoefficient
        wilksTotal = round(100 * wilksPreRounding) / 100
        
    }
    
    var wilksResult: Double {
        get { return wilksTotal }
    }
    
    
    
}