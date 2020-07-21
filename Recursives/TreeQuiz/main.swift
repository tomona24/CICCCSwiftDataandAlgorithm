//
//  main.swift
//  TreeQuiz
//
//  Created by Tomona Sako on 2020/07/20.
//  Copyright © 2020 Tomona Sako. All rights reserved.
//

import Foundation

let diaTree = """
5
1 3 2 -1
2 4 4 -1
3 1 2 4 3 -1
4 2 4 3 3 5 6 -1
5 4 6 -1
"""

diameter(tree: diaTree)

let whoTree = """
12
1 2
1 3
2 4
3 5
3 6
4 7
4 8
5 9
5 10
6 11
6 12
"""

whoIsMyParent(tree: whoTree)
