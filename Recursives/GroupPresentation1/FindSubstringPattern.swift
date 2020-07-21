//
//  FindSubstringPattern.swift
//  GroupPresentationI
//
//  Created by Tomona Sako on 2020/07/14.
//  Copyright © 2020 Tomona Sako. All rights reserved.
//

import Foundation

// Boyer-Moor-Horspool
func findSubstringPattern( text: String,  p : String) -> Int {
    var valueOfPattern : Dictionary<Character, Int>
    valueOfPattern = [:]
    var i = 1
    for c in p {
        if valueOfPattern[c] == nil {
            valueOfPattern[c] =  i
        }
        i += 1
    }
    print(valueOfPattern)
    
    return searchPattern(text: text, p: p, dic: valueOfPattern, lastIndex: 0)
}

// return
// the String contains the pattern => -1
func searchPattern (text: String, p: String, dic: Dictionary<Character, Int>, lastIndex: Int) -> Int{
    if text.count < p.count {
        return -1
    } else {
        var skipNum = 0
        var i = p.count - 1
        
        while i >= 0 {
            let index = p.index(p.startIndex, offsetBy: i)
            if let value = dic[text[index]] {
                if skipNum == 0 {
                    skipNum = value
                }
            }
            
            if text[index] != p[index] {
                if skipNum == 0 {
                    skipNum = p.count
                } else {
                    skipNum = p.count - i
                }
                break;
            }
            i -= 1
        }
        
        if i == -1 {
            return lastIndex
        } else {
            let index = text.index(text.startIndex, offsetBy: skipNum)
            return searchPattern(text: String(text[index..<text.endIndex]), p: p, dic: dic, lastIndex: lastIndex + skipNum )
        }
    }
}
