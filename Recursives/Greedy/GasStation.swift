//
//  GasStation.swift
//  Greedy
//
//  Created by Tomona Sako on 2020/07/30.
//  Copyright © 2020 Tomona Sako. All rights reserved.
//

import Foundation

func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
    var difs = [Int](repeating: 0, count: gas.count)
    
    for i in 0..<gas.count {
        let dif = gas[i] - cost[i]
        difs[i] = dif
    }
    
    var total = 0
    var currentTotal = 0
    var firstP = 0
    for i in 0..<gas.count * 2 {
        let i2 = i % gas.count
        total += difs[i2]
        currentTotal += difs[i2]
        if currentTotal < 0{
            firstP = i2 + 1
            currentTotal = 0
        }
    }
    
    if total < 0 {
        return -1
    } else {
        return firstP
    }
}
