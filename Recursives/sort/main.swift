//
//  main.swift
//  sort
//
//  Created by Tomona Sako on 2020/07/06.
//  Copyright © 2020 Tomona Sako. All rights reserved.
//

import Foundation

var arr: [Int] = [2, 4, 5, 8, 1, 6, 3, 7, 9, 15, 13, 11 ]

quickSort(&arr, 0, arr.count - 1)
print(arr)



func quickSort<T: Comparable>(_ arr: inout [T], _ start: Int, _ end: Int) {
    if end - start > 0 {
        let pivotIndex = partition(&arr, start, end);
        if (pivotIndex != 0) {
            quickSort(&arr, 0, pivotIndex - 1);
            quickSort(&arr, pivotIndex + 1, end);
        }
    }
}
/// Returns the index of the pivot
/// - Parameters:
///   - arr: the array
///   - start: the start index
///   - end: the end index
/// - Returns: the index of the pivot after partitioning
func partition<T: Comparable>(_ arr: inout [T], _ start: Int, _ end: Int) -> Int {
    if end - start < 1 {
        return 0;
    } else {
        var startIndex = start;
        var pivotIndex = end;
        while (startIndex < pivotIndex) {
            if arr[startIndex] > arr[pivotIndex] {
                let move = arr.remove(at: startIndex)
                arr.insert(move, at: pivotIndex)
                pivotIndex -= 1;
            } else {
                startIndex += 1;
            }
        }
        return pivotIndex;
    }
}
