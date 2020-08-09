//
//  LCA.swift
//  LCA
//
//  Created by Tomona Sako on 2020/07/21.
//  Copyright © 2020 Tomona Sako. All rights reserved.
//

import Foundation

func LCA() {
    let N = Int(readLine()!)!
    var tree = [[Int]](repeating: [Int](), count: N + 1)
    var check = [Bool] (repeating: false, count: N + 1)
    var depth = [Int](repeating: 0, count: N + 1)
    var parents = [Int](repeating: -1, count: N + 1)
    

    for _ in 1..<N {
        let m = readLine()!.split(separator: " ").map{ Int(String($0))! }
        let left = m[0]
        let right = m[1]
        tree[left].append(right)
        tree[right].append(left)
    }
    
    func bfs (root: Int, tree: [[Int]]) {
        check[root] = true
        var q = [Int]()
        q.append(root)
        
        while !q.isEmpty {
            let p = q.removeFirst()
            for v in tree[p] {
                if !check[v] {
                    check[v] = true
                    depth[v] = depth[p] + 1
                    parents[v] = p
                    q.append(v)
                }
            }
        }
    }
    
    bfs(root: 1, tree: tree)
    
    var numOfm = Int(readLine()!)!

    for _ in 0..<numOfm {
        let m = readLine()!.split(separator: " ").map{ Int($0)!}
        var deep = m[0]
        var shallow = m[1]
        
        var d : Int = depth[deep]
        if depth[deep] < depth[shallow] {
            swap(&deep, &shallow)
            d = depth[deep]
        }
        
        while depth[deep] != depth[shallow] {
//            for n in tree[deep] {
//                if depth[n] == d - 1 {
//                    deep = n
//                    d -= 1
//                }
            deep = parents[deep]
//            }
        }
        
        // deep and shallow has same depth
        
        while deep != shallow {
            deep = parents[deep]
            shallow = parents[shallow]
        }
        
        print(deep)
        
    }

}


//
//func LCA() {
//    let N = Int(readLine()!)!
//    var tree = [[Int]](repeating: [Int](), count: N)
//    var depthTree = [Int](repeating: -1, count: N)
//
//    for _ in 0..<N {
//        let node = readLine()!.split(separator: " ").map{ Int(String($0))!}
//        let left = node[0]
//        let right = node[1]
//        tree[left].append(right)
//        tree[right].append(left)
//    }
//
//    let M = Int(readLine()!)!
//    var pairNodes = [[Int]]()
//    for _ in 0..<M {
//        let line = readLine()!.split(separator: " ").map { Int(String($0))!}
//        pairNodes.append([line[0], line[1]])
//    }
//
//    func dfs (start: Int, depth: Int, treeList: inout [[Int]], depthTree: inout [Int] ) {
//        depthTree[start] = depth
//        for v in treeList[start] {
//            if depthTree[v] != -1 {
//                dfs(start: v, depth: depth + 1, treeList: &treeList, depthTree: &depthTree)
//            }
//        }
//    }
//
//    dfs(start: 1, depth: 0, treeList: &tree, depthTree: &depthTree)
//
//    for i in 0..<M {
//        let nodes = pairNodes[i]
//        let p = nodes[0]
//        let q = nodes[1]
//        let pd = depthTree[p]
//        let qd = depthTree[q]
//        var deeper = pd > qd ? p : q
//        var shallower = pd < qd ? p : q
//        for i in 0..<tree[deeper].count {
//            if depthTree[tree[deeper][i]] == depthTree[deeper] - 1 {
//                deeper = tree[deeper][i]
//            }
//
//            if depthTree[deeper] == depthTree[shallower] {
//                break;
//            }
//        }
//
//        var que = Queue<Int>()
//
//
//
//    }
//
//}
//





//private var tree4LCA = [[Int]].init()
//
//private var nodeInfo = [[Int]].init()

//func lowestCommonAncestor(input: String) {
//    let n = Int(String(input.prefix(upTo: input.firstIndex(of: "\n")!)))!
//    var visited = [Bool](repeating: false, count: n)
//    let readInput: [[Int]] = input.suffix(from: input.index(after: input.index(after: input.startIndex))).split(separator: "\n").map{$0.split(separator: " ").map{Int($0)!}}
//    nodeInfo = [[Int]](repeating: [Int].init(), count: n)
//    
//
//    var countNum = 0
//    while (readInput[countNum].count != 1) {
//        let from = readInput[countNum][0]
//        let to = readInput[countNum][1]
//        nodeInfo[from - 1].append(to)
//        nodeInfo[to - 1].append(from)
//    countNum += 1
//    }
//    
//    let k = readInput[countNum][0]
//    countNum += 1
//    var lcaList = [[Int]](repeating: [Int](repeating: 0, count: 2), count: k)
//
//    for i in 0..<k {
//        let first = readInput[countNum][0]
//        let second = readInput[countNum][1]
//        lcaList[i][0] = first
//        lcaList[i][1] = second
//        countNum += 1
//    }
//        print(nodeInfo)
//    
//    var reach = [Bool].init()
//    var history = [Int].init()
//    
//    for i in 0..<lcaList.count {
//        lowestCommonAncestorHelper(visited: visited, reach: reach, first: lcaList[i][0], second: lcaList[i][1], nodeInfo: nodeInfo, history: &history, current: 1)
//    }
//}
//
//
//func lowestCommonAncestorHelper(visited : [Bool], reach: [Bool], first : Int, second: Int, nodeInfo: [[Int]], history: inout [Int], current: Int) {
//    print(reach)
//    print(history)
//    if visited[current - 1] == true {
//        history.popLast();
//       return
//       }
//    if reach.count == 2 {
//        print(history.popLast())
//        history.removeAll()
//        return
//    } else {
//       var checkedV = visited
//        var reach2 = reach
//       checkedV[current - 1] = true;
//       for i in 0..<nodeInfo[current - 1].count {
//           let next = nodeInfo[current - 1][i]
//            if next == first || next == second{
//                reach2.append(true)
//            }
//            if reach2.count == 0 {
//                history.append(current)
//            } else {
//                "top"
//            }
//               lowestCommonAncestorHelper(visited : checkedV, reach: reach2, first : first, second: second, nodeInfo: nodeInfo, history: &history, current: next)
//           }
//       }
//}
