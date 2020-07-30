//
//  CourseSchedule.swift
//  Assignment
//
//  Created by Tomona Sako on 2020/07/29.
//  Copyright © 2020 Tomona Sako. All rights reserved.
//

import Foundation

class Solution {
    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        var dag = [[Int]](repeating: [Int](), count: numCourses)
        var indegree = [Int](repeating: 0, count: numCourses )
        var check = [Bool](repeating: false, count: numCourses)
        
        for order in prerequisites {
            let pre = order[0]
            let after = order[1]
            dag[order[1]].append(order[0])
            indegree[order[0]] += 1
        }
        
        // topological sort
        var q = [Int]()
        
        for v in 0..<numCourses {
            if indegree[v] == 0 {
                q.append(v)
            }
        }
        
        // BFS
        while !q.isEmpty {
            let u = q.first!
            q.removeFirst()
            
            check[u] = true
            for v in dag[u] {
                indegree[v] -= 1
                if indegree[v] == 0 {
                    q.append(v)
                }
            }
        }
        
        for checked in check {
            if !checked {
                return false
            }
        }
        return true
    }
}
