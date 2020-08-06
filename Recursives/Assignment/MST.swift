////
////  MST.swift
////  SwiftAGDS
////
////  Created by Derrick Park on 7/30/20.
////  Copyright © 2020 Derrick Park. All rights reserved.
////
//
//import Foundation
//
//struct Edge {
//  var v: Int
//  var w: Int
//}
//extension Edge : Comparable {
//  static func <(lhs: Edge, rhs: Edge) -> Bool {
//    return lhs.w < rhs.w
//  }
//}
//extension Edge : Hashable {}
//
//
///// Minimum Spanning Tree Algorithms
//public final class MST {
//  
//  /// Prim's MST Algorithm O(ElgV)
//  /// Use Priority Queue (Binary Heap) and Adjacency List
//  /// - Parameter graph: adjacency list of weighted undirected graph where each edge is stored as Tuple
//  /// - Returns: the minimum cost spanning tree
//  public func primMST(_ graph: [[(v: Int, w: Int)]]) -> Int {
//    
//    var q = IndexPriorityQueue<Edge>(<)
//    var checked = [Bool](repeating: false, count: graph.count)
//    var tree = [Edge]()
//    
//    var index = 0
//    var minEdge :Edge = Edge.init(v: graph[0][0][0], w: graph[0][0][1])
//    
//    for i in 0..<graph.count {
//        for k in 0..<graph[i].count {
//            let v = graph[i][k][0]
//            let w = graph[i][k][1]
//            let edge: Edge = Edge.init(v: v, w: w)
//            q.enqueue(edge)
//            if minEdge < edge {
//                index = i
//            }
//        }
//    }
//    
//    checked[index] = true
//    
//    while !q.isEmpty {
//        let minWeightE = q.dequeue()!
//        let v = minWeightE.v
//        let w = minWeightE.w
//        if checked[v - 1] == true && checked[index] == true {
//            continue
//        } else {
//        checked[v - 1] = true
//        tree.append(minWeightE)
//        }
//    }
//    return tree.map { $0.w }.reduce(0, +)
//  }
//  
//  /// Kruskal's MST Algorithm O(ElgE)
//  /// Use Union-Find and Adjacency List (You can use Swift's built-in sort method.)
//  /// - Parameter graph: adjacency list of weighted undirected graph where each edge is stored as Tuple
//  /// - Returns: the minimum cost spanning tree
//  public func kruskalMST(_ graph: [[(v: Int, w: Int)]]) -> Int {
//      let n = graph.count
//      var mstEdges = [(u: Int, v: Int, w: Int)]()
//      var allEdges = [(u: Int, v: Int, w: Int)]()
//      for (u, node) in graph.enumerated() {
//        for edge in node {
//          allEdges.append((u: u, v: edge.v, w: edge.w))
//        }
//      }
//      allEdges.sort { $0.w < $1.w }
//      
//      var uf = UF(n)
//      for edge in allEdges {
//        if uf.connected(edge.u, edge.v) { continue }
//        uf.union(edge.u, edge.v)
//        mstEdges.append(edge)
//      }
//      return mstEdges.map { $0.w }.reduce(0, +)
//    }
//  }
