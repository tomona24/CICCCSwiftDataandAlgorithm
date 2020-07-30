//
//  TwoCityScheduling.swift
//  Greedy
//
//  Created by Tomona Sako on 2020/07/29.
//  Copyright © 2020 Tomona Sako. All rights reserved.
//

import Foundation
func twoCitySchedCost(_ costs: [[Int]]) -> Int {
    var sum = 0
    for c in costs {
        
    }
    let costSorted = costs.sorted { $0[0] - $0[1] < $1[0] - $1[1]  }
    
    print(costSorted)
    
    for c in 0..<costSorted.count / 2 {
        let costA = costSorted[c][0]
        sum += costA
    }
    
    for c in costSorted.count / 2 ..< costSorted.count {
        let costB = costSorted[c][1]
        sum += costB
    }
    return sum
}
