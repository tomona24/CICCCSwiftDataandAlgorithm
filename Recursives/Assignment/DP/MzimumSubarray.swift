//
//  MzimumSubarray.swift
//  Assignment
//
//  Created by Tomona Sako on 2020/08/13.
//  Copyright © 2020 Tomona Sako. All rights reserved.
//

import Foundation
//func maxSubArray(_ nums: [Int]) -> Int {
//    var dp = [[Int]](repeating: [Int](repeating: 0, count: nums.count), count: nums.count)
//
//    var max = nums.max()!
//    var count = 0
//
//    for i in 0..<nums.count {
//        dp[i][i] = nums[i]
//        for i2 in i+1..<nums.count {
//            dp[i][i2] += dp[i][i2 - 1] + nums[i2]
//            if max < dp[i][i2] {
//                max = dp[i][i2]
//                count = i2 - i + 1
//            }}
//    }
//
//    print(dp)
//    return count
//}

func maxSubArray(_ nums: [Int]) -> Int {
    var dp = nums
    var max = nums.max()!
    
    for i in 1..<nums.count {
        dp[i] = nums[i]
        if dp[i] < dp[i - 1] + nums[i]   {
            dp[i] = dp[i - 1] + nums[i]
            
            if max < dp[i] {
                max = dp[i]
            }
        }
    }
    
    return max
}

