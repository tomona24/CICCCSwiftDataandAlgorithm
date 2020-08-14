//
//  ProblemSet(DP).swift
//  Assignment
//
//  Created by Tomona Sako on 2020/08/10.
//  Copyright © 2020 Tomona Sako. All rights reserved.
//

import Foundation

func TwoxNtile(n: Int) -> Int{
    // possibility
    var hako = [Int](repeating: 0, count: n + 1)
    
    if n <= 2 {
        return n
    }
    
    hako[1] = 1
    hako[2] = 2
    
    for i in 3...n {
        hako[i] = hako[i - 1] + hako [i - 2]
    }
    
    return hako[n]
}


func TwoxNtileMinus2(n: Int) -> Int{
    // possibility
    var hako = [Int](repeating: 0, count: n + 1)
    
    
    hako[1] = 1
    hako[2] = 3
    hako[3] = 5
    hako[4] = 9
    
    //    2^2 + 1
    
    if n > 3 {
        for i in 4...n {
            hako[i] = hako[i - 1] + 2 * hako [i - 2]
        }
    }
    return hako[n]
}


//func OneTwoThree(n: Int) -> Int{
//    // possibility
//    var hako = [Int](repeating: 0, count: n + 1)
//
//    hako[1] = 1
//    hako[2] = 2
//    hako[3] = 4
//
//
//    if n > 3 {
//        for i in 4...n {
//            hako[i] = hako[i - 3]  + hako[i - 2] + hako [i - 2]
//        }
//    }
//    return hako[n]
//}


func OneTwoThree(){
    // possibility
    var hako = [Int](repeating: 0, count: 12)
    hako[1] = 1
    
    for i in 3...11 {
        for j in 1...3 {
            if i >= j {
                hako[i] += hako[i - j]
            }
        }
    }
    
    let t = Int(readLine()!)!
    for _ in 0..<t {
        let n = Int(readLine()!)!
        print(hako[n])
    }
}

//6

func PrettyNumber() {
    
}




// 7. Non-decreasing Digits

func NonDecreasingDigits(N : Int)  {
    var d = [[Int]](repeating: [Int](repeating: 0, count: 10), count: N + 1)
    
    // 1 digits (base case)
    for l in 0...9 {
        d[1][l] = 1
    }
    
    // 2- digits
    for n in 2...N {
        for l in 0...9{
            for i in 0...l {
                d[n][l] += d[n - 1][i]
            }
        }
    }
    
    // count
    print(d)
    
    var ans = 0
    for i in 0...9 {
        ans += d[N][i]
    }
    
    print(ans)
    //    return ans
    
}


//8
func lengthOfLIS(_ nums: [Int]) -> Int {
    if nums.isEmpty {
        return 0
    }
    var dp = [Int](repeating: 1, count: nums.count)
    //    var ans = 1
    
    for i in 1..<nums.count {
        var max = 0
        for j in 0..<i{
            if nums[j] < nums[i] && max < dp[j]{
                max = dp[j]
            }
            dp[i] = max + 1
            //            if dp[i] > ans {
            //            ans = dp[i]
            //        }
        }
    }
    
    return dp.max()!
}

// T.C: O(N)
func judgeSquareSum(_ c: Int) -> Bool {
    var sc = Int(sqrt(Double(c)))
    for a in 0...sc {
        for b in 0...sc {
            var i = a * a + b * b
            if i == c {
                return true
            }
        }
    }
    return false
}

// T.C: O(sqrt(N)*lg(sqrt(N)))
func judgeSquareSum2(_ c: Int) -> Bool {
    var sc = Int(sqrt(Double(c)))
    
    for a in 0...sc {
        for b in 0...sc {
            var i = a * a + b * b
            if i == c {
                return true
            }
        }
    }
    return false
}


func SumOFSquareNumbers2 (n: Int) -> Int{
    var sq = [Int](repeating: 0, count: n)
    var dp = [Int](repeating: 0, count: n)
    
    for i in 0..<n {
        sq[i] = i*i
    }
    
    //    dp[1] = 1
    //    dp[2] = 2 (1^2 + 1^2)
    //    dp[3] = 3 (1^2 + 1^2 + 1^2)
    //    dp[4] = 1 (2^2)
    //    dp[5] = 2 (2^2 + 1^2)
    //    x^2 < 5
    
    //    do[5] = (x^2) + dp[5-(x^2)]
    
    for i in 0...Int(sqrt(Double(n))) {
        var best = Int.max
        var sq = i^2
        
    }
    
    return 0
}


func Pokemon () -> Int {
    let first = readLine()!.split(separator: " ").map { Int($0)}
    let row = first[0]!
    let clm = first[1]!
    
    var graph = [[Int]](repeating: [Int](repeating: 0, count: clm + 1), count: row + 1)
    var dp = [[Int]](repeating: [Int](repeating: 0, count: clm + 1), count: row + 1)
    
    for i in 1...row {
        let column = readLine()!.split(separator: " ").map { Int($0)! }
        for j in 0..<column.count {
        graph[i][j + 1] = column[j]
        }
    }
    
    
    for r in 1...row {
        for c in 1...clm {
            dp[r][c] = max(dp[r-1][c], dp[r][c-1]) + graph[r][c]
        }
    }

    print(dp)
    
    return dp[row][clm]
}
