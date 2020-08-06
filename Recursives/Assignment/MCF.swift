//
//  MCF.swift
//  Assignment
//
//  Created by Tomona Sako on 2020/08/06.
//  Copyright © 2020 Tomona Sako. All rights reserved.
//



import Foundation

public struct UFind {
  /// parent[i] = parent of i
  private var parent: [Int]
  /// size[i] = number of nodes in tree rooted at i
  private var size: [Int]
  /// number of components
  private(set) var count: Int

  /// Initializes an empty union-find data structure with **n** elements
  /// **0** through **n-1**.
  /// Initially, each elements is in its own set.
  /// - Parameter n: the number of elements
  public init(_ n: Int) {
    self.count = n
    self.size = [Int](repeating: 1, count: n)
    self.parent = [Int](repeating: 0, count: n)
    for i in 0..<n {
      self.parent[i] = i
    }
  }

  /// Returns the canonical element(root) of the set containing element `p`.
  /// - Parameter p: an element
  /// - Returns: the canonical element of the set containing `p`
  public mutating func find(_ p: Int) -> Int {
    var root = p
    while root != parent[root] { // find the root
      root = parent[root]
    }
    var p = p
    while p != root {
      let newp = parent[p]
      parent[p] = root  // path compression
      p = newp
    }
    return root
  }

  /// Returns `true` if the two elements are in the same set.
  /// - Parameters:
  ///   - p: one elememt
  ///   - q: the other element
  /// - Returns: `true` if `p` and `q` are in the same set; `false` otherwise
  public mutating func connected(_ p: Int, _ q: Int) -> Bool {
    return find(p) == find(q)
  }

  /// Merges the set containing element `p` with the set containing
  /// element `q`
  /// - Parameters:
  ///   - p: one element
  ///   - q: the other element
  public mutating func union(_ p: Int, _ q: Int) {
    let rootP = find(p)
    let rootQ = find(q)
    guard rootP != rootQ else { return } // already connected

    // make smaller root point to larger one
    if size[rootP] < size[rootQ] {
      parent[rootP] = rootQ
      size[rootQ] += size[rootP]
    } else {
      parent[rootQ] = rootP
      size[rootP] += size[rootQ]
    }
    count -= 1
  }

}



// Pipe struct
struct Pipe {
    var name: String
    var from: Int
    var to: Int
    var cost : Int
    var isActive: Bool
}

extension Pipe : Comparable {
  static func <(lhs: Pipe, rhs: Pipe) -> Bool {
    return lhs.cost < rhs.cost
  }
}


func MCF () -> Int {
    let firstLine = readLine()!.split(separator: " ").map {Int(String($0))!}
    let N = firstLine[0]
    let M = firstLine[1]
    let D = firstLine[2]
    
    let numOfGraph = M - N
    
    // 2D array (each tomato location)
//    var inactivePipes = [Pipe]()
    var inactivePipes : Dictionary<String, Pipe>
    inactivePipes = [:]
    var allPipes = [Pipe]()
    var mstPipes = [Pipe]()
    var originalCost = 0
    
    for i in 1...M {
        let line = readLine()!.split(separator: " ").map {Int(String($0))!}
        let from = line[0]
        let to = line[1]
        let cost = line[2]
        let isActive : Bool = i < N
        let pipe : Pipe = Pipe(name: String(from)+String(to), from: from, to: to, cost: cost, isActive: isActive)
        
        allPipes.append(pipe)
        
        if isActive {
            originalCost += cost
        }

        if i >= N {
            inactivePipes[pipe.name] = pipe
//            inactivePipes.append(pipe)
        }
    }
    
    allPipes.sort()
    
    var uf = UFind(M + 1)
    var needDiactivate : Dictionary<String, Pipe>
    needDiactivate = [:]
    var minCost = 0
    var canEnhance = false
    
    for p in allPipes {
        if uf.connected(p.from, p.to) {
            if p.isActive {
                needDiactivate[p.name] = p
            }
            continue
        }
        uf.union(p.from, p.to)
        mstPipes.append(p)
        minCost += p.cost
        if D <= p.cost {
            canEnhance = true
        }
    }
    
    if canEnhance {
        minCost -= D
    }
    
    var day = 0
    
    print(mstPipes)
    print(needDiactivate)
    print(inactivePipes)
    for p in needDiactivate {
        if inactivePipes[p.key] == nil {
            day += 1
        }
    }
    
    return minCost < originalCost ? day : 0
}
