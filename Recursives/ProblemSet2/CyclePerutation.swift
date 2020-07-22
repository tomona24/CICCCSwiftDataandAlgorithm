//
//  CyclePerutation.swift
//  ProblemSet2
//
//  Created by Tomona Sako on 2020/07/22.
//  Copyright © 2020 Tomona Sako. All rights reserved.
//

import Foundation

func cyclePermutation () {
    let cases = Int(readLine()!)!
    for _ in 0..<cases {
        let n = Int(readLine()!)!
        var visited = [Bool](repeating: false, count: n)
        let elements = readLine()!.split(separator: " ").map{Int(String($0))!}
        var answer = 0;
        for k in 0..<n {
            let q = Queue<Int>()
            if visited[k] == false {
                q.enqueue(item: elements[k])
                visited[k] = true
            }
            while !q.isEmpty() {
                let e = q.dequeue()! - 1
                
                if visited[e] == false {
                    q.enqueue(item: elements[e])
                    visited[e] = true
                } else {
                    answer += 1
                }
            }
        }
        print(answer)
    }
}


