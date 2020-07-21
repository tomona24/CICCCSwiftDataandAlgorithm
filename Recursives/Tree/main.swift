//
//  TreeTraversals.swift
//  SwiftAGDS
//
//  Created by Derrick Park on 7/10/20.
//  Copyright © 2020 Derrick Park. All rights reserved.
//

import Foundation
// LeetCode Pattern
//class TreeNode<String> {
//  var data: String?
//  var left: TreeNode<String>?
//  var right: TreeNode<String>?
//}

func preOrder(_ node: Int) {
  if node == -1 { return }
  print(Character(UnicodeScalar(node + 65)!), terminator: "")
  preOrder(tree[node][0])
  preOrder(tree[node][1])
}

func inOrder(_ node: Int) {
  if node == -1 { return }
  preOrder(tree[node][0])
  print(Character(UnicodeScalar(node + 65)!), terminator: "")
  preOrder(tree[node][1])
}

func postOrder(_ node: Int) {
  if node == -1 { return }
  preOrder(tree[node][0])
  preOrder(tree[node][1])
  print(Character(UnicodeScalar(node + 65)!), terminator: "")
}

var tree = [[Int]](repeating: [Int](repeating: 0, count: 2), count: 26)

func treeTraversal() {
  
  // get user input and store in our 2D data structure
  let n = Int(readLine()!)!
  for _ in 0..<n {
    let nodeInfo = readLine()!.split(separator: " ").map { String($0) }
    // A, B, C, ..., Z
    let x = Int(Character(nodeInfo[0]).asciiValue! - 65)
    let l = Int(Character(nodeInfo[1]).asciiValue!)
    let r = Int(Character(nodeInfo[2]).asciiValue!)
    // ascii 46 -> . -> -1
    tree[x][0] = l == 46 ? -1 : l - 65
    tree[x][1] = r == 46 ? -1 : r - 65
  }
  
  preOrder(0)
  print()
  inOrder(0)
  print()
  postOrder(0)
  print()
}

treeTraversal()
