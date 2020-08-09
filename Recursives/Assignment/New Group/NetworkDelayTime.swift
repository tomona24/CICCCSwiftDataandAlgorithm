//
//  NetworkDelayTime.swift
//  Assignment
//
//  Created by Tomona Sako on 2020/08/06.
//  Copyright © 2020 Tomona Sako. All rights reserved.
//

import Foundation

func networkDelayTime(_ times: [[Int]], _ N: Int, _ K: Int) -> Int {
    var graph = [[[Int]]](repeating: [[Int]](), count: N)
    var costs = [Int](repeating: Int.max, count: N)
    var check = [Bool](repeating: false, count: N)
    
    for time in times {
        let from = time[0] - 1
        let to = time[1] - 1
        let cost = time[2]
        let node = [from, to, cost]
        graph[from].append(node)
    }
    
    print(graph)
    
    costs[K - 1] = 0
    
    var q = [[Int]]()
    q.append(contentsOf: graph[K-1])
    

    while !q.isEmpty {
        let node = q.removeFirst()
        let nodeFrom = node[0]
        let nodeTo = node[1]
//        let nodeCost = node[2]
        check[nodeFrom] = true
        print(node)
        for nextCity in graph[nodeTo] {
            let to = nextCity[1]
            let cost = nextCity[2]
            print(costs[to])
            print(costs[nodeFrom] + cost)
            if costs[to] > costs[nodeFrom] + cost {
                print("!")
                costs[to] = costs[nodeFrom] + cost
                print(q)
            }
        q.append(contentsOf: graph[to])
    }
    


    }

    return -1
}
    
    
    //    diagram (from K)
    // mscArray (some are infinity)
    // if no infinity, get the maxmam time.

    
