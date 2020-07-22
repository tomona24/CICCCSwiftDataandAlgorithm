//
//  WhoIsMyParent.swift
//  TreeQuiz
//
//  Created by Tomona Sako on 2020/07/21.
//  Copyright © 2020 Tomona Sako. All rights reserved.
//

import Foundation

private var tree4Who = [[Int]].init()


func whoIsMyParent(tree : String) {
    let n = Int(String(tree.prefix(upTo: tree.firstIndex(of: "\n")!)))!
    var visited = [Bool](repeating: false, count: n)
    let nodeInfo = tree.suffix(from: tree.index(after: tree.index(after: tree.startIndex))).split(separator: "\n").map{$0.split(separator: " ").map{Int($0)!}}
    tree4Who = [[Int]](repeating: [Int].init(), count: n)

    for i in 0..<n - 1 {
        let from = nodeInfo[i][0]
        let to = nodeInfo[i][1]
        tree4Who[from - 1].append(to)
        tree4Who[to - 1].append(from)
    }
    print(nodeInfo)
    print(tree4Who)
    var tree4Out: [Int] = [Int](repeating: 0, count: n)
    whoIsMyParentHelper( current: 1, n: 0, visited: visited, tree4Out : &tree4Out)
    for i in 1..<tree4Out.count {
        print(tree4Out[i])
    }
    
}


func whoIsMyParentHelper(current: Int, n : Int, visited: [Bool], tree4Out: inout [Int]) {
    if visited[current - 1] == true {
        return
    } else {
        var checkedV = visited
        checkedV[current - 1] = true;
        for i in 0..<tree4Who[current - 1].count {
            let next = tree4Who[current - 1][i]
            if visited[next - 1] != true {
                
                tree4Out[next - 1] = current
            }
            whoIsMyParentHelper(current: next, n: i, visited: checkedV, tree4Out: &tree4Out)
        }
    }
}


