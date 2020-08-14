    //
    //  CheapestFlightsWithinKStops.swift
    //  Assignment
    //
    //  Created by Tomona Sako on 2020/08/06.
    //  Copyright © 2020 Tomona Sako. All rights reserved.
    //
    
    import Foundation
    func findCheapestPrice(_ n: Int, _ flights: [[Int]], _ src: Int, _ dst: Int, _ K: Int) -> Int {
        
        struct Flight {
            let from: Int
            let to: Int
            let cost: Int
        }
        
        
        var adj = [[Flight]](repeating: [Flight](), count: n)
        var costs = [Int](repeating: Int.max, count: n)
        var steps = [Int](repeating: -1, count: n)
        var check = [Bool](repeating: false, count: n)
        

        for f in flights {
            let flight = Flight(from: f[0], to: f[1], cost: f[2])
            adj[f[0]].append(flight)
        }
        
//        var q = [Flight]()
//        q.append(contentsOf: adj[src])
        costs[src] = 0

        func dfs(start: Int, adj: inout [[Flight]], check: inout [Bool], costs: inout [Int], step: Int) {
            check[start] = true
            for flight in adj[start] {
                if !check[flight.to] && step + 1 < K && costs[flight.to] > flight.cost + costs[flight.from] || !check[flight.to] && step + 1 == K && flight.to == dst && costs[flight.to] > flight.cost + costs[flight.from] {
                    costs[flight.to] = flight.cost + costs[flight.from]
                    steps[flight.to] = steps[flight.from] + 1
                    dfs(start: flight.to, adj: &adj, check: &check, costs: &costs, step: step + 1)
                }

            }
        }
        dfs(start: src, adj: &adj, check: &check, costs: &costs, step: -1)
        
        
//        while !q.isEmpty {
//            let flight = q.removeFirst()
//            let from = flight.from
//            let to = flight.to
//            let cost = flight.cost
//
////            if costs[to] > cost + costs[from] && steps[from] + 1 < K || costs[to] > cost + costs[from] && steps[from] + 1 == K && to == dst{
////                check[to] = true
////                costs[to] = cost + costs[from]
////                steps[to] = steps[from] + 1
////                q.append(contentsOf: adj[to])
////            }
//            for flight in adj[to] {
//                check[to] = true
//                costs[to] = cost + costs[from]
//                steps[to] = steps[from] + 1
//                q.append(contentsOf: adj[flight.to])
//            }
//        }
        print(steps)
        print(costs)
        print(check)
        return check[dst] == true ? costs[dst] : -1
    }
    
    //    func findCheapestPrice(_ n: Int, _ flights: [[Int]], _ src: Int, _ dst: Int, _ K: Int) -> Int {
    //        struct Flight {
    //            let from: Int
    //            let to: Int
    //            let cost: Int
    //        }
    //        var costs = [Int](repeating: Int.max, count: n)
    //        var steps = [Int](repeating: -1, count: n)
    //        var check = [Bool](repeating: false, count: n)
    //
    //        var adj = [[Flight]](repeating: [Flight](), count: n)
    //
    //        for f in flights {
    //            let from = f[0]
    //            let to = f[1]
    //            let cost = f[2]
    //            adj[from].append(Flight(from: from, to: to, cost: cost))
    //        }
    //
    //        costs[src] = 0
    //        check[src] = true
    //
    //        var q = [Flight]()
    //        q.append(contentsOf: adj[src])
    //
    //        while !q.isEmpty {
    //            let current = q.removeFirst()
    //            let from = current.from
    //            let to = current.to
    //            let cost = current.cost
    //
    //
    //            if steps[from] + 1 < K || steps[from] + 1 == K && to == dst{
    //
    //                if costs[to] > costs[from] + cost {
    //                    check[to] = true
    //                    steps[to] = steps[from] + 1
    //                    costs[to] = costs[from] + cost
    //                    q.append(contentsOf: adj[to])
    //                }
    //            }
    //        }
    //
    //        print(check)
    //        print(costs)
    //        print(steps)
    //
    //        if check[dst] {
    //            return costs[dst]
    //        } else{
    //            return -1
    //        }
    //    }
    
    //
    //    func findCheapestPrice(_ n: Int, _ flights: [[Int]], _ src: Int, _ dst: Int, _ K: Int) -> Int {
    //        struct City {
    //            let from : Int
    //            let to : Int
    //            let cost: Int
    //        }
    //
    //        var costs = [Int](repeating: Int.max, count: n)
    //        var steps = [Int](repeating: -1, count: n)
    //        var check = [Bool](repeating: false, count: n)
    //
    //        var adj = [[City]](repeating: [City](), count: n)
    //
    //        for flight in flights {
    //            let from = flight[0]
    //            let to = flight[1]
    //            let cost = flight[2]
    //
    //            adj[from].append(City(from: from, to: to, cost: cost))
    //        }
    //
    //        costs[src] = 0
    //        //        check[src] = true
    //
    //        var q = [City]()
    //        q.append(contentsOf: adj[src])
    //
    //        while !q.isEmpty {
    //            let city = q.removeFirst()
    //            let current = city.from
    //
    //            for nextCity in adj[current] {
    //                let to = nextCity.to
    //                let cost = nextCity.cost
    //                if costs[to] > costs[current] + cost{
    //                    if steps[current] + 1 <= K {
    //                        steps[to] =  1 + steps[current]
    //                        costs[to] = costs[current] + cost
    //                        check[to] = true
    //                        q.append(contentsOf: adj[to])
    //                    }
    //                }
    //            }
    //        }
    //
    //        //        for _ in 0..<n {
    //        //            var min = Int.max
    //        //            var minCity = 0
    //        //            for v in 0..<n {
    //        //                if !check[v] && costs[v] < min {
    //        //                    min = costs[v]
    //        //                    minCity = v
    //        //                }
    //        //            }
    //        //
    //        //            check[minCity] = true
    //        //            if !adj[minCity].isEmpty {
    //        //            for nextCity in adj[minCity] {
    //        //                let to = nextCity.to
    //        //                let cost = nextCity.cost
    //        //                steps[to] +=  1 + steps[minCity]
    //        //                if costs[to] > costs[minCity] + cost {
    //        //                    if steps[to] > K {
    //        //                        costs[to] = Int.max
    //        //                    } else {
    //        //                    costs[to] = costs[minCity] + cost
    //        //                    }
    //        //                }
    //        //                }
    //        //
    //        //            }
    //        //        }
    //
    //
    //        if check[dst] {
    //            return costs[dst]
    //        } else {
    //            // use diagstra
    //            // but not only store cost, but also add up the stops ( as a second cost)
    //            return -1
    //        }
    //    }
