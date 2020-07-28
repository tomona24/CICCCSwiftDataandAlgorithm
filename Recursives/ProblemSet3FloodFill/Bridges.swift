//
//  Bridges.swift
//  ProblemSet3FloodFill
//
//  Created by Tomona Sako on 2020/07/28.
//  Copyright © 2020 Tomona Sako. All rights reserved.
//

import Foundation

func Bridges() {
    struct Square {
        let x: Int
        let y: Int
    }
    
    let dx = [0, 0, 1, -1]
    let dy = [1, -1, 0, 0]
    
    
    let firstLine = readLine()!.split(separator: " ").map {Int(String($0))!}
    let mapSize = firstLine[0]
    
    // 2D array (each tomato location)
    var ilandMap = [[Int]]()
    var groupMap = [[Int]](repeating: [Int](repeating: 0, count: mapSize), count: mapSize)
    var answer : Int = mapSize*mapSize
    
    var q = Queue<Square>()
    
    for _ in 0..<mapSize {
        let row = readLine()!.split(separator: " ").map { Int(String($0))! }
        ilandMap.append(row)
    }
    
    // grouping
    var id = 1
    for x in 0..<mapSize {
        for y in 0..<mapSize {
            if ilandMap[y][x] == 1 && groupMap[y][x] == 0 {
                q.enqueue(item: Square(x: x, y: y))
                
                while !q.isEmpty() {
                    let square = q.dequeue()
                    let x = square!.x
                    let y = square!.y
                    if ilandMap[y][x] == 1 {
                        groupMap[y][x] = id
                        for i in 0..<4 {
                            let nx = x + dx[i]
                            let ny = y + dy[i]
                            if nx >= 0 && nx < mapSize && ny >= 0 && ny < mapSize {
                                if ilandMap[ny][nx] == 1 && groupMap[ny][nx] == 0 {
                                    q.enqueue(item: Square(x: nx, y: ny))
                                }
                            }
                        }
                        
                    }
                }
                id += 1
            }
        }
    }
    // check the distance from each other
    
    func bfs(mapSize: Int,  q: inout Queue<Square>) {
        while !q.isEmpty() {
            let square = q.dequeue()
            let x = square!.x
            let y = square!.y
            
            let current = ilandMap[y][x]
            if ilandMap[y][x] >= 1 {
                for i in 0..<4 {
                    let nx = x + dx[i]
                    let ny = y + dy[i]
                    if nx >= 0 && nx < mapSize && ny >= 0 && ny < mapSize {
                        // fill the distance
                        if ilandMap[ny][nx] == 0 && groupMap[ny][nx] == 0 {
                            ilandMap[ny][nx] = current + 1
                            groupMap[ny][nx] = groupMap[y][x]
                            q.enqueue(item: Square(x: nx, y: ny))
                        }
                        
                        // check the different group or not
                        if ilandMap[ny][nx] > 0 && groupMap[y][x] != groupMap[ny][nx] {
                            let smaller = ilandMap[y][x] > ilandMap[ny][nx] ? ilandMap[y][x] : ilandMap[ny][nx]
                            if smaller < answer {
                                answer = smaller
                            }
                        }
                        
                    }
                }
                
            }
        }
    }
    
    // enqueue the edge of each ilands
    for x in 0..<mapSize {
        for y in 0..<mapSize {
            if ilandMap[y][x] == 1  {
                var countEdge = 0
                for i in 0..<4 {
                    let nx = x + dx[i]
                    let ny = y + dy[i]
                    if nx >= 0 && nx < mapSize && ny >= 0 && ny < mapSize {
                        if groupMap[ny][nx] == 0 {
                            countEdge += 1
                        }
                    }
                }
                if countEdge > 0 {
                    q.enqueue(item:  Square(x: x, y: y))
                }
            }
        }
    }
    bfs(mapSize: mapSize, q: &q)
    
    print(answer)
}
