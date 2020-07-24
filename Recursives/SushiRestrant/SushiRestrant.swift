//
//  SushiRestrant.swift
//  SushiRestrant
//
//  Created by Tomona Sako on 2020/07/23.
//  Copyright © 2020 Tomona Sako. All rights reserved.
//

import Foundation

func SushiRestaurantReview () {
    var hako = [Int].init()
    
    func dfs (start: Int, restaurantList: inout [[Int]], check: inout [Bool], checkR: inout [Int: Bool], count: inout Int, countR: inout Int){
        
        if countR == checkR.count {
            return
        }
        
        check[start] = true;
        if checkR[start] != nil {
            checkR[start] = true
            countR += 1

            print("countup")
        } else {
            count += 1
            print("countup back!")
        }
        
        if countR == checkR.count {
            print("last")
            print(checkR)
            print(count + countR - 1)
            return
        }
        
        print(start)
        print(check)
        print(checkR)
        print(count)
        print(countR)
        
        
        print()
        
        

        

        
        for v in restaurantList[start] {
            if !check[v] {
                dfs(start: v, restaurantList: &restaurantList, check: &check, checkR: &checkR, count: &count, countR: &countR)
            }
        }
    
    }
    
    let firstLine = readLine()!.split(separator: " ").map {Int(String($0))!}
    let n = firstLine[0]
    let nr = firstLine[1]
    var restrans = [[Int]](repeating: [], count: n)
    let realSushis = readLine()!.split(separator: " ").map { Int($0)! }
    
    var check: [Bool] = [Bool](repeating: false, count: n)
    var checkR: [Int: Bool] = [:]
    var count = 0;
    var countR = 0;
    
    for i in 0..<nr {

        checkR[realSushis[i]] = false
    }
    
    for _ in 0..<n - 1 {
        let r = readLine()!.split(separator: " ").map {Int(String($0))!}
        let current = r[0]
        let next = r[1]
        restrans[current].append(next)
        restrans[next].append(current)
    }
    
    print(restrans)
    print(check)
    print(realSushis)
    
    var leafReal = realSushis[0]
    for i in 1..<realSushis.count {
        if restrans[realSushis[i]].count == 1 {
            leafReal = realSushis[i]
            break
        }
    }
    
    dfs(start: leafReal, restaurantList: &restrans, check: &check, checkR: &checkR, count: &count, countR: &countR)
}
