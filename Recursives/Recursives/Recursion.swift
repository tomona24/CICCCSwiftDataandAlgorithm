//
//  Recursion.swift
//  SwiftAGDS
//
//  Created by Derrick Park on 6/23/20.
//  Copyright © 2020 Derrick Park. All rights reserved.
//

import Foundation


// 1. power(base, exponent): base^exponent
// assume exponent >= 0
func power(base: Int, exponent: Int) -> Int {
  assert(exponent >= 0)
  // base case
  if exponent == 0 { return 1 }
  // recursive case
  return base * power(base: base, exponent: exponent - 1)
}

// 2. isPalindrome(word): checks if a word is palindrome
func isPalindrome(_ word: String) -> Bool {
  // base case
  if word.count <= 1 { return true }
  // recursive case
  if let first = word.first, let last = word.last, first == last {
    return isPalindrome(word[1, word.count - 1])
  }
  return false
}

// 3. printBinary(n): prints binary form of given int
func printBinary(_ n: Int, padding: String) {
  print(padding, #function, n)
  if n < 0 {
    print("-", terminator: "")
    printBinary(-n, padding: padding + " ")
  }
  
  // base case
  if n < 2 {
    print(n, terminator: "") // prints without newline
    return
  }
  // recursive
  printBinary(n / 2, padding: padding + "  ")
  print(n % 2, terminator: "")
}

// 4. reverseLines
// - Print all lines in reverse order (recursively) from a text file
// - You can change the function header if you want

func reverseLines(_ line: Int) {
  let contents = try! String(contentsOfFile: "/Users/tomona_s/Documents/05_CICCC/DataAndAlgorithm/Recursives/Recursives/story.txt")
  let sentences = contents.split(separator: "\n")
//  print(sentences)
  // MARK: - YOUR RECURSIVE CODE GOES HERE...
    if line == 0 {
        return
    } else {
        print(sentences[line])
        reverseLines( line - 1 )
    }

// 5. evaluate
// Write a recursive function evaluate that accepts a string
// representing a math expression and computes its value.
// - The expression will be "fully parenthesized" and will
//   consist of + and * on single-digit integers only.
// - You can use a helper function. (Do not change the original function header)
// - Recursion

// evaluate("7")  -> 7
// evaluate("(2+2)") ->4
// evaluate("(1 + (2*4))") -> 9
// evaluate("((1+3)+((1+2)*5))") -> 19
    

    func evaluate(_ str : String) -> Int{
        print(str)
        if str.count < 4 {
            return Int(str[0])!
        } else {
            let end = str.firstIndex(of: ")")!
            let start = str.prefix(through: end).lastIndex(of: "(")!
            let range = start...end
            evaluate(str.replacingCharacters(in: range, with: evaluate_helper(String(str[range]))))
        }
        return 0
    }

    func evaluate_helper(_ str: String) -> String {
        let start = str.index(str.startIndex, offsetBy: 1)
        let last = str.index(before: str.endIndex)
        if str.contains("+") {
            let s = str.firstIndex(of: "+")!
            let nextS = str.index(after: s)
            return String(Int(str[start..<s])! + Int(str[nextS..<last])!)
        } else {
            let s = str.firstIndex(of: "*")!
            let nextS = str.index(after: s)
            return String(Int(str[start..<s])! * Int(str[nextS..<last])!)
        }
    }


    func rollDiceSum(n: Int, sum: Int, choices: inout[Int]) {
        if n == 0 {
            print(choices)
        } else {
            for i in 1...6 {
                choices.append(i)
                
                rollDiceSum(n: n-1, sum:sum, choices: &choices)
                
            }
        }
    }
    
    
}
