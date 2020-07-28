//
//  TomatoFarm.swift
//  ProblemSet3FloodFill
//
//  Created by Tomona Sako on 2020/07/26.
//  Copyright © 2020 Tomona Sako. All rights reserved.
//

import Foundation

func TomatoFarm() {
    struct Square {
        let x: Int
        let y: Int
    }
    
    let dx = [0, 0, 1, -1]
    let dy = [1, -1, 0, 0]
    
    
    let firstLine = readLine()!.split(separator: " ").map {Int(String($0))!}
    let m = firstLine[0]
    let n = firstLine[1]
    
    // 2D array (each tomato location)
    var tomatoBox = [[Int]]()
    var groupMap = [[Int]](repeating: [Int](repeating: 0, count: m), count: n)
    var answer : Int = -1
    
    func bfs(x: Int, y: Int, id: Int, m: Int, n: Int, n0: inout Int) {
        let q = Queue<Square>()
        q.enqueue(item: Square(x: x, y: y))
        groupMap[y][x] = id
        
        while !q.isEmpty() {
            for i in 0..<n {
                print(tomatoBox[i])
            }
            
            let square = q.dequeue()
            let x = square!.x
            let y = square!.y
            var current = tomatoBox[y][x]
            if tomatoBox[y][x] >= 1 {
                for i in 0..<4 {
                    let nx = x + dx[i]
                    let ny = y + dy[i]
                    
                    if nx >= 0 && nx < m && ny >= 0 && ny < n {
                        if tomatoBox[ny][nx] == 0 && groupMap[ny][nx] == 0 {
                            tomatoBox[ny][nx] = current + 1
                            n0 -= 1
                            q.enqueue(item: Square(x: nx, y: ny))
                            groupMap[ny][nx] = id

                            answer = current
                        }

                    }
                }
                
            }
        }
    }
    
    
    
    for _ in 0..<n {
        let row = readLine()!.split(separator: " ").map { Int(String($0))! }
        tomatoBox.append(row)
    }
    
    var id = 0
    for i in 0..<n {
        print(tomatoBox[i])
    }
    
    var numberOfZero = 0

    for x in 0..<m {
        for y in 0..<n {
            if tomatoBox[y][x] == 0 {
                numberOfZero += 1
            }
            if tomatoBox[y][x] >= 1 && groupMap[y][x] == 0 {
                id += 1
                bfs(x: x, y: y, id: id, m: m, n: n, n0 : &numberOfZero)
            }
        }
}
    
    if numberOfZero > 0 {
        print(-1)
    } else {
    print(id)
    print(answer)
    }
}


