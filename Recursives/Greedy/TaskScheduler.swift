//
//  Tasks.swift
//  Greedy
//
//  Created by Tomona Sako on 2020/07/29.
//  Copyright © 2020 Tomona Sako. All rights reserved.
//

import Foundation


func leastInterval(_ tasks: [Character], _ n: Int) -> Int {
  var frequencies = [Int](repeating: 0, count: 26)
  var maxCount = 0
  var maxFreq = 0
  
  for task in tasks {
    let i = Int(task.asciiValue!) - 65
    frequencies[i] += 1
  }
  
  for freq in frequencies {
    if freq == 0 { continue }
    if maxFreq < freq {
      maxFreq = freq
      maxCount = 1
    } else if maxFreq == freq {
      maxCount += 1
    }
  }
  
  let placeHolderLength = (n + 1) * (maxFreq - 1) + maxCount
  return tasks.count > placeHolderLength ? tasks.count : placeHolderLength
}

//// alphabetの数 26
//    func leastInterval(_ tasks: [Character], _ n: Int) -> Int {
//        var alphabets = Set<Character>()
//        for i in tasks {
////            alphaList.insert(i)
//        }
//
//
//
//        var taskList = tasks.sorted()
//        var lastletter = tasks[0]
//        var completedTaks = [Character]()
//
//
//        return 0
//    }
