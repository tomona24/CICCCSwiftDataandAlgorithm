    //
    //  NetworkDelayTime.swift
    //  Assignment
    //
    //  Created by Tomona Sako on 2020/08/06.
    //  Copyright © 2020 Tomona Sako. All rights reserved.
    //
    
    import Foundation
    
    func networkDelayTime(_ times: [[Int]], _ N: Int, _ K: Int) -> Int {
        var graph = [[[Int]]](repeating: [[Int]](), count: N + 1)
        var costs = [Int](repeating: 0, count: N + 1)
        var check = [Bool](repeating: false, count: N + 1)
        
        for time in times {
            let from = time[0]
            let to = time[1]
            let cost = time[2]
            let node = [from, to, cost]
            graph[from].append(node)
        }
        
        costs[K] = 0
        check[K] = true
        var takenTime = -1
        
        var q = [[Int]]()
        q.append(contentsOf: graph[K])

        while !q.isEmpty {
            let node = q.removeFirst()
            let nodeFrom = node[0]
            let nodeTo = node[1]
            let nodeCost = node[2]
            check[nodeTo] = true
            costs[nodeTo] = nodeCost + costs[nodeFrom]
            if takenTime < costs[nodeTo] {
              takenTime = costs[nodeTo]
              }
                for nextCity in graph[nodeTo] {

                    let from = nextCity[0]
                    let to = nextCity[1]
                    let cost = nextCity[2]
                    if !check[to] {
                    costs[to] = costs[from] + cost
                    check[to] = true
                    if takenTime < costs[to] {
                    takenTime = costs[to]
                    }

                    q.append(contentsOf: graph[to])
                    }
                }
        }
        
    
        return takenTime
    }
    
    
    //    diagram (from K)
    // mscArray (some are infinity)
    // if no infinity, get the maxmam time.
    
    
