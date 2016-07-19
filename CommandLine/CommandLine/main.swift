//
//  main.swift
//  CommandLine
//
//  Created by Jon Manning on 19/07/2016.
//  Copyright © 2016 Secret Lab. All rights reserved.
//

import Foundation

let data = try! String(contentsOfFile: "data.csv")

let lines = data.componentsSeparatedByCharactersInSet(NSCharacterSet.newlineCharacterSet())

var foodTotal = 0
var fuelTotal = 0



for lineNumber in 1..<lines.count {
    
    let line = lines[lineNumber]
    
    let columns = line.componentsSeparatedByString(",")
    
    let name = columns[0]
    
    guard let weight = Int(columns[1]) else {
        fatalError("Line \(lineNumber): Cannot parse number: \(columns[1])")
    }
    
    switch name {
    case "Mars Food":
        foodTotal += weight
    case "Neptune Fuel":
        fuelTotal += weight
    default:
        fatalError("Line \(lineNumber): Invalid type: \(name)")
    }
    
}

print("Mars Food: \(foodTotal)")
print("Neptune Fuel: \(fuelTotal)")
