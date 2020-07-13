//
//  Stack.swift
//  DataStructures1
//
//  Created by Tomona Sako on 2020/07/12.
//  Copyright © 2020 Tomona Sako. All rights reserved.
//

import Foundation
public final class Stack<E> : Sequence {
    private var top: Node<E>? = nil
    private(set) var count: Int = 0
    
    /// helper linked list node class
    fileprivate class Node<E> {
        fileprivate var item: E
        fileprivate var next: Node<E>?
        fileprivate init(item: E, next: Node<E>? = nil) {
            self.item = item
            self.next = next
        }
    }
    
    public init() {}
    
    
    public func isEmpty() -> Bool {
        return count == 0
    }
    
    public func push(item: E) {
        let oldTop = top
        top = Node<E>(item: item, next: oldTop)
        count += 1
    }
    
    public func pop() -> E?{
        if isEmpty() {
            let popNode = top
            top = popNode?.next
            count -= 1
            return popNode
        }
        return nil
    }

    public func peek() -> E?{
        if !isEmpty() {
            return top
        }
        return nil
    }
    
    
    /// BagIterator that iterates over the items in this bag in arbitrary order. (reverse order)
    public struct StackIterator<E> : IteratorProtocol {
        private var current: Node<E>?
        
        fileprivate init(_ top: Node<E>?) {
            self.current = top
        }
        
        public mutating func next() -> E? {
            if let item = current?.item {
                current = current?.next
                return item
            }
            return nil
        }
        
        public typealias Element = E
    }
    
    /// Returns an iterator that iterates over the items in this bag in reverse order.
    public func makeIterator() -> StackIterator<E> {
        return StackIterator<E>(first)
    }
}

extension Stack: CustomStringConvertible {
    public var description: String {
        return self.reduce(into: "") { $0 += "\($1), "}
    }
}
