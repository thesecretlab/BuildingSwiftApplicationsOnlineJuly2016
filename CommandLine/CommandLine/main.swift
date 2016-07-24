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

// the total values of the different

var foodTotal = 0
var fuelTotal = 0

var totals = [
    "fuel":0,
    "food":0
]

for lineNumber in 1..<lines.count {
    
    let line = lines[lineNumber]
    
    if line.characters.count == 0 {
        continue // skip this line
    }
    
    let columns = line.componentsSeparatedByString(",")
    
    totals[columns[0]] = totals[columns[0]] ?? 0 + 2

//    // typo!
//    if let currentFuel = totals["feul"] {
//        totals["fuel"] = currentFuel + 2
//    }
    
    guard columns.count == 2 else {
        fatalError("Columns must be 2")
    }
    
    let name = columns[0]
    
    if let weight = Int(columns[1]) {
        switch name {
        case "Mars Food":
            foodTotal += weight
        case "Neptune Fuel":
            fuelTotal += weight
        default:
            fatalError("Line \(lineNumber): Invalid type: \(name)")
        }
    } else {
        fatalError("Could not convert int")
    }
    
}

print("Mars Food: \(foodTotal)")
print("Neptune Fuel: \(fuelTotal)")
