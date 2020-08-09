//
//  MakeOne.swift
//  Assignment
//
//  Created by Tomona Sako on 2020/08/07.
//  Copyright © 2020 Tomona Sako. All rights reserved.
//

import Foundation

func MakeOne(N: Int) -> Int{
    if N == 1 {
        return 0
    }
    
    var arr = [Int](repeating: 0, count: N + 1)
    arr[3] = 1
    arr[2] = 1
    arr[1] = 0
    
    for i in N...3 {
        
    }
        
    return arr[N]
}
