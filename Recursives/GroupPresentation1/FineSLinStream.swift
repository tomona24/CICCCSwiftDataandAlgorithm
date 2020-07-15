//
//  FineSLinStream.swift
//  GroupPresentationI
//
//  Created by Tomona Sako on 2020/07/14.
//  Copyright © 2020 Tomona Sako. All rights reserved.
//

import Foundation

class TreeNode<Int> {
  var data: Int?
  var left: TreeNode<Int>?
  var right: TreeNode<Int>?
}

// 8 10 3 1 7 4 6 13 14
// [[][]
// 8
//Input
//5 10 (m n)
//10
//9
//8
//7
//6
//5
//4
//3
//2
//1
//Output
//10
//9
//8
//7
//6 (edited)


//func findSmalleInSttream () {
//    let firstLine = readLine()!.split(separator: " ")
//    let m = Int(firstLine[0])!
//    let n = Int(firstLine[1])!
//    var tree = [TreeNode](repeating: TreeNode, count: n)
//    
//    for _ in 0..<n {
//        let num = readLine()!
//        
//    }
//    
//    let n = Int(readLine()!)!
//    for _ in 0..<n {
//      let nodeInfo = readLine()!.split(separator: " ").map { String($0) }
//      // A, B, C, ..., Z
//      let x = Int(Character(nodeInfo[0]).asciiValue! - 65)
//      let l = Int(Character(nodeInfo[1]).asciiValue!)
//      let r = Int(Character(nodeInfo[2]).asciiValue!)
//      // ascii 46 -> . -> -1
//      tree[x][0] = l == 46 ? -1 : l - 65
//      tree[x][1] = r == 46 ? -1 : r - 65
//    }
//}
//
//func binaryHeap
