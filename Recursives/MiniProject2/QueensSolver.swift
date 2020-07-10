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
    var countCol = 0;
    searchRow(board: &board, row: 0, col: &cols, numQ: 0, lastCol: nil, countCol: 0)
}

func searchRow(board: inout Board, row: Int, col: inout [Int], numQ: Int, lastCol :Int?, countCol: Int) {
    count += 1
    if row == 0 && col.count == board.size - 1 {
        return
    }
    if numQ == board.size{
        print(board.description)
        return
    }
    if row >= board.size && numQ > 0 || countCol >= col.count && numQ > 0{
            if let lastCol = lastCol{
            col.append(lastCol)
            board.remove(row: row - 1, col: lastCol)
        }
    }
    else {
        if col.count > 0 && countCol < board.size {
            if board.isSafe(row: row, col: col[countCol]) {
                let popCol = col.remove(at: countCol)
                board.place(row: row, col: popCol)
                searchRow(board: &board, row: row + 1, col: &col
                    , numQ: numQ + 1, lastCol: popCol, countCol: 0 )
            }
                searchRow(board: &board, row: row, col: &col, numQ: numQ, lastCol: lastCol, countCol: countCol + 1)

        } else {
            searchRow(board: &board, row: row + 1, col: &col, numQ: numQ, lastCol: lastCol, countCol: 0)
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
