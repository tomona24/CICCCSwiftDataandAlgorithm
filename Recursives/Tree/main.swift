//
//  main.swift
//  Tree
//
//  Created by Tomona Sako on 2020/07/10.
//  Copyright © 2020 Tomona Sako. All rights reserved.
//

import Foundation

func preOrder(_node : Int) {
    if node == -1 {
        return
    } else {
    print(Character(UnicodeScalar(node + 65)!), terminator: "")  // default terminator: "\n"
    preOrder(_node: tree[node][0])
    preOrder(_node: tree[node][1])
    }
}

func inOrder(_node : Int) {
    if node == -1 {
        return
    } else {
    preOrder(_node: tree[node][0])
    print(Character(UnicodeScalar(node + 65)!), terminator: "")  // default terminator: "\n"
    preOrder(_node: tree[node][1])
    }
}


func preOrder(_node : Int) {
    if node == -1 {
        return
    } else {
    preOrder(_node: tree[node][0])
    preOrder(_node: tree[node][1])
    print(Character(UnicodeScalar(node + 65)!), terminator: "")  // default terminator: "\n"
    }
}
