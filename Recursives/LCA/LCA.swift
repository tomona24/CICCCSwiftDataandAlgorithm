//
//  LCA.swift
//  LCA
//
//  Created by Tomona Sako on 2020/07/21.
//  Copyright © 2020 Tomona Sako. All rights reserved.
//

import Foundation

private var tree4LCA = [[Int]].init()

private var nodeInfo = [[Int]].init()

func lowestCommonAncestor(input: String) {
    let n = Int(String(input.prefix(upTo: input.firstIndex(of: "\n")!)))!
    var visited = [Bool](repeating: false, count: n)
    let readInput: [[Int]] = input.suffix(from: input.index(after: input.index(after: input.startIndex))).split(separator: "\n").map{$0.split(separator: " ").map{Int($0)!}}
    nodeInfo = [[Int]](repeating: [Int].init(), count: n)
    

    var countNum = 1
    while (readInput[countNum].count != 1) {
        print(readInput[countNum])
        let from = readInput[countNum][0]
        let to = readInput[countNum][1]
        nodeInfo[from - 1].append(to)
    countNum += 1
    }
    
    let k = readInput[countNum][0]
    countNum += 1
    var lcaList = [[Int]](repeating: [Int](repeating: 0, count: 2), count: k)

    for i in 0..<k {
        let first = readInput[countNum][0]
        let second = readInput[countNum][1]
        lcaList[i][0] = first
        lcaList[i][1] = second
        countNum += 1
    }
        print(nodeInfo)
    
    var reach = [Bool].init()
    var history = [Int].init()
    
    for i in 0..<lcaList.count {
        lowestCommonAncestorHelper(visited: visited, reach: reach, first: lcaList[i][0], second: lcaList[i][1], nodeInfo: nodeInfo, history: &history, current: 1)
    }
}


func lowestCommonAncestorHelper(visited : [Bool], reach: [Bool], first : Int, second: Int, nodeInfo: [[Int]], history: inout [Int], current: Int) {
    print(reach)
    print(history)
    if visited[current - 1] == true {
        history.popLast();
       return
       }
    if reach.count == 2 {
        print(history.popLast())
        history.removeAll()
        return
    } else {
       var checkedV = visited
        var reach2 = reach
       checkedV[current - 1] = true;
       for i in 0..<nodeInfo[current - 1].count {
           let next = nodeInfo[current - 1][i]
            if next == first || next == second{
                reach2.append(true)
            }
            if reach2.count == 0 {
                history.append(current)
            } else {
                "top"
            }
               lowestCommonAncestorHelper(visited : checkedV, reach: reach2, first : first, second: second, nodeInfo: nodeInfo, history: &history, current: next)
           }
       }
}
