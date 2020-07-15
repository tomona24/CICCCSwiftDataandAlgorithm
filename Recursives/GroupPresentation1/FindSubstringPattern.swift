//
//  FindSubstringPattern.swift
//  GroupPresentationI
//
//  Created by Tomona Sako on 2020/07/14.
//  Copyright © 2020 Tomona Sako. All rights reserved.
//

import Foundation

// Boyer-Moor-Horspool
func findSubstringPattern( str: String,  p : String) -> Int {
    var valueOfPattern : Dictionary<Character, Int>
    valueOfPattern = [:]
    for c in p {
        if valueOfPattern[c] == nil {
            let index = p.lastIndex(of: c)
            let d = p.distance(from: index!, to: p.endIndex) - 1
            valueOfPattern[c] =  d
        }
    }
    return searchPattern(str: str, p: p, dic: valueOfPattern, lastIndex: 0)
}

// return
// the String contains the pattern => -1
// else => the position of Chalactors in the map
func searchPattern (str: String, p: String, dic: Dictionary<Character, Int>, lastIndex: Int) -> Int{
    if str.count < p.count {
        return -1
    } else {
        var valueIndex = 0
        var i = p.count - 1
        
        while i >= 0 {
            let index = p.index(p.startIndex, offsetBy: i)
            if let value = dic[str[index]] {
                if valueIndex == 0 {
                    valueIndex = value
                }
            }
            
            if str[index] != p[index] {
                if valueIndex == 0 {valueIndex = p.count}
                break;
            }
            i -= 1
        }
        
        if i == -1 {
            return lastIndex
        } else {
            let index = str.index(str.startIndex, offsetBy: valueIndex)
            return searchPattern(str: String(str[index..<str.endIndex]), p: p, dic: dic, lastIndex: lastIndex + valueIndex )
        }
    }
}
