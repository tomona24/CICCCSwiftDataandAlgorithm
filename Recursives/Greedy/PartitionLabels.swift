//
//  PartitionLabels.swift
//  Greedy
//
//  Created by Tomona Sako on 2020/07/30.
//  Copyright © 2020 Tomona Sako. All rights reserved.
//

import Foundation
func partitionLabels(_ S: String) -> [Int] {
    var list = Array(S)
    var nums = [[Int]](repeating: [Int](repeating: -1, count: 2), count: 26)
    var answers = [Int]()
    for i in 0..<list.count {
        let asci = Int(list[i].asciiValue! - 97)
        if nums[asci][0] == -1 {
            nums[asci][0] = i
        } else {
            nums[asci][1] = i
        }
    }
    
    func helper (char: inout Int) -> Int  {
        var initial = Int(list[char].asciiValue! - 97)
        var firstIndex = Int(nums[initial][0])
        var lastIndex = Int(nums[initial][1])
//        var targets = Array(Set(list[nums[initial][0]...nums[initial][1]]))
        var targets = [Character]()
        var check = [Character : Bool]()
        for i in firstIndex...lastIndex {
            if check[list[i]] == nil {
                targets.append(list[i])
                check[list[i]] = true
            }
        }

        var i = 0
        while i < targets.count {
            let asci = Int(targets[i].asciiValue! - 97)
            if nums[asci][1] > lastIndex {
                for k in lastIndex...nums[asci][1] {
                    if check[list[k]] == nil {
                        targets.append(list[k])
                        check[list[k]] = true
                    }
                }
                lastIndex = nums[asci][1]

            }
            i += 1
        }
        

        char = lastIndex + 1

        return lastIndex - firstIndex + 1
    }
    
    var currentCharIndex = 0
    
    while currentCharIndex < list.count {
        var initial = Int(list[currentCharIndex].asciiValue! - 97)
        if nums[initial][1] == -1 {
            answers.append(1)
            currentCharIndex += 1
        } else {
            let dif = helper(char: &currentCharIndex)
            answers.append(dif)
        }
    }

    return answers
}
