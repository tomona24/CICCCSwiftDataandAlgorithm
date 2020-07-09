//
//  QueensSolver.swift
//  SwiftAGDS
//
//  Created by Derrick Park on 2019-03-13.
//  Copyright © 2019 Derrick Park. All rights reserved.
//

import Foundation

/// Write a function solveQueens that accepts a Board as a parameter
/// and tries to place 8 queens on it safely.
///
/// - Your method should stop exploring if it finds a solution
/// - You are allowed to change the function header (args or return type)
/// - Your total recursive calls should not exceed 120 times.

var count = 0
func solveQueens(board: inout Board) {
    var cols = Array(0..<board.size)
    searchRow(board: &board, row: 0, col: &cols, numQ: 0, lastCol: nil)
}

func searchRow(board: inout Board, row: Int, col: inout [Int], numQ: Int, lastCol :Int?) {
    print(row, col, numQ, lastCol)
    if row == 0 && col.count == 0 {
        return
    }
    if numQ == board.size{
        count += 1
        print(board.description)
        col = Array(0..<board.size)
//        return
        if let lastCol = lastCol{
            board.remove(row: row - 1, col: lastCol)
        }
    } else if row >= board.size && numQ > 0 || col.count <= 0 && numQ > 0{
        print("remove")
        if let lastCol = lastCol{
            col.append(lastCol)
            board.remove(row: row - 1, col: lastCol)
        }
    }
    else {
        if col.count > 0 {
            let popCol = col.remove(at: 0)
            if board.isSafe(row: row, col: popCol) {
                print("place")

                board.place(row: row, col: popCol)
                print(board.description)

                searchRow(board: &board, row: row + 1, col: &col
                    , numQ: numQ + 1, lastCol: popCol)
            }
            if col.count == 1 && row == 7 {
                col.append(popCol);
                print("remove")
                if let lastCol = lastCol{
                    col.append(lastCol)
                    board.remove(row: row - 1, col: lastCol)
                }
            }
            else {
            col.append(popCol);
            searchRow(board: &board, row: row, col: &col, numQ: numQ, lastCol: lastCol)
            }
        } else {
            print("next row")
            searchRow(board: &board, row: row + 1, col: &col, numQ: numQ, lastCol: lastCol)
        }
        
    }
}



////
////  QueensSolver.swift
////  SwiftAGDS
////
////  Created by Derrick Park on 2019-03-13.
////  Copyright © 2019 Derrick Park. All rights reserved.
////
//
//import Foundation
//
///// Write a function solveQueens that accepts a Board as a parameter
///// and tries to place 8 queens on it safely.
/////
///// - Your method should stop exploring if it finds a solution
///// - You are allowed to change the function header (args or return type)
///// - Your total recursive calls should not exceed 120 times.
//
//var count = 0
//func solveQueens(board: inout Board) {
//    searchRow(board: &board, row: 0, col: 0, numQ: 0, lastCol: nil)
//}
//
//func searchRow(board: inout Board, row: Int, col: Int, numQ: Int, lastCol :Int?) {
//    if row == 0 && col == 8 {
//        return
//    }
//    if numQ == board.size{
//        count += 1
//        print(board.description)
////        return
//        if let lastCol = lastCol{
//            board.remove(row: row - 1, col: lastCol)
//        }
//    } else if row >= board.size && numQ > 0 || col >= board.size && numQ > 0{
//        if let lastCol = lastCol{
//            board.remove(row: row - 1, col: lastCol)
//        }
//    }
//    else {
//        if col < board.size {
//            if board.isSafe(row: row, col: col) {
//                board.place(row: row, col: col)
//                searchRow(board: &board, row: row + 1, col: 0
//                    , numQ: numQ + 1, lastCol: col)
//            }
//            searchRow(board: &board, row: row, col: col + 1, numQ: numQ, lastCol: lastCol)
//        } else {
//            searchRow(board: &board, row: row + 1, col: 0, numQ: numQ, lastCol: lastCol)
//        }
//
//    }
//}
