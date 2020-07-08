//
//  main.swift
//  Recursives
//
//  Created by Tomona Sako on 2020/06/23.
//  Copyright © 2020 Tomona Sako. All rights reserved.
//

import Foundation

print("Hello, World!")

//reverseLines(5)

func printDecimal ( _ d: Int, _ str: String = "") {
    if ( d == 0 ) {
        print(str)
    } else {
        for i in 0...9 {
        printDecimal(d-1, "\(str)\(i)")
        }
    }
}

//printDecimal(2)

func permutation(_ word : String = "Park") {
    permutation_helper(word.lowercased())
}

func permutation_helper(_ word : String, _ newWord: String = "") {
    if ( word.count == 0 ) {
        print (newWord)
    } else {
        for i in 0..<word.count {
            permutation_helper(word[0, i] + word[i+1, word.count] , "\(newWord)\(word[i])")
        }
    }
}

permutation()
