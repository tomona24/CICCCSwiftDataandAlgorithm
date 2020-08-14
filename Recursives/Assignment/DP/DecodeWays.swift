//
//  DecodeWays.swift
//  Assignment
//
//  Created by Tomona Sako on 2020/08/13.
//  Copyright © 2020 Tomona Sako. All rights reserved.
//

import Foundation

//func numDecodings(_ s: String) -> Int {
//    if s == "0" {
//        return 0
//    }
//    var arr = Array(s)
//    var dp = [Int](repeating: 0, count: s.count + 2)
//
//    dp[1] = 1
//    dp[2] = 2
//
////    if arr[1] == "0" {
////    dp[2] = 1
////    } else {
////    }
//
//    if s.count > 3 {
//        for i in 3...s.count {
////            if arr[i] == "0" {
////            dp[i] = dp[i-1] + dp[i-2] - 1
////            } else {
//            dp[i] = dp[i-1] + dp[i-2]
////            }
//        }
//    }
//
//    print(dp)
//
//    return dp[s.count]
//}


func numDecodings(_ s: String) -> Int {
    let arr = Array(s)
    var dp = [Int](repeating: 0, count: s.count + 2)
    
    dp[0] = 1
    dp[1] = s.first! == "0" ? 0 : 1
    
    if s.count >= 2 {
        for i in 2...s.count {
            let firstDigit = Int(String(arr[i - 1]))!
            if firstDigit >= 1{
                dp[i] += dp[i - 1]
            }
            let twoDigits = firstDigit + Int(String(arr[i - 2]))! * 10
            if twoDigits >= 10 && twoDigits <= 26 {
                dp[i] += dp[i - 2]

            }
        }
    }
    
    return dp[s.count]
}
