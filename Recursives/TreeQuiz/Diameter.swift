//
//  Diameter.swift
//  TreeQuiz
//
//  Created by Tomona Sako on 2020/07/20.
//  Copyright © 2020 Tomona Sako. All rights reserved.
//

import Foundation

var treeArr :[[[Int]]] = [[[Int]]].init()

func diameter() {
    let n = Int(readLine()!)!
//    let n = Int(String(tree.first!))!
//    let nodeInfo = tree.suffix(from: tree.index(after: tree.index(after: tree.startIndex))).split(separator: "\n").map{$0.split(separator: " ").map{Int($0)!}}
    let visited: [Bool] = [Bool](repeating: false, count: n)
    var longest : Int = 0
    
    for i in 0..<n {
    treeArr.append([[Int]].init())
    var m = 1
        let nodeInfo = readLine()!.split(separator: " ").map {Int($0)!}
        while (nodeInfo[m] != -1) {
            let next = nodeInfo[m]
            let dis = nodeInfo[m + 1]
            let node : [Int] = [next, dis]
            treeArr[i].append(node)
            m += 2
        }
    }
    
    for k in 1..<n {
        diameterHelper(nodeNo: k , currentRoute: 0, visited: visited, current: 0, longest: &longest, visitNum: 0)
    }
    print(longest)
}

func diameterHelper( nodeNo: Int, currentRoute: Int, visited : [Bool], current: Int, longest : inout Int, visitNum : Int) {
    if visitNum == treeArr.count {
        return
    }
    
    let nextNodeNo = treeArr[nodeNo - 1][currentRoute][0] - 1
    if visited[nextNodeNo] == true {
        if longest < current {
            longest = current

        }

        return
    }
    
    let currentCheck = treeArr[nodeNo - 1][currentRoute]
    var checkedVisited = visited
    checkedVisited[nodeNo - 1] = true;

    for i in 0 ..< treeArr[nextNodeNo].count {
        diameterHelper(nodeNo: currentCheck[0], currentRoute: i, visited: checkedVisited, current: current + currentCheck[1], longest: &longest , visitNum: visitNum + 1)
    }
}


