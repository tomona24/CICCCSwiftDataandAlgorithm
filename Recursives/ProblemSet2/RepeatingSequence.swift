//
//  RepeatingSequence.swift
//  ProblemSet2
//
//  Created by Tomona Sako on 2020/07/22.
//  Copyright © 2020 Tomona Sako. All rights reserved.
//

import Foundation

func repeatingSequence() {
    let input = readLine()!.split(separator: " ").map{String($0)}
    var check:Set<String> = []
    var answers = [String]()
    let p = Double(input[1])!
    
    func makeNext (previous: String) -> String{
        let digit = previous.count
        var pointer = previous.startIndex
        var next = 0
        for _ in 0..<digit {
            let n = Double(String(previous[pointer]))!
            let a = pow(n, p)
            next += Int(a)
            pointer = previous.index(after: pointer)
        }
        return String(next)
    }
    
    check.insert(input[0])
    answers.append(input[0])
    var next = makeNext(previous: input[0])
    
    while !check.contains(next) {
        check.insert(next)
        answers.append(next)
        next = makeNext(previous: next)
    }
    
    for i in 0..<check.count {
        if answers[i] == next {
            print(i)
            break;
        }
    }
}
