//
//  Stack.swift
//  SwiftAlgorithmsDataStructures
//
//  Created by Derrick Park on 2/12/20.
//  Copyright © 2020 Derrick Park. All rights reserved.
//

import Foundation

/// The Stack class represents a last-in-first-out (LIFO) stack of generic items.
/// It supports the usual *push* and *pop* operations, along with methods for peeking at the top item, testing if the stack is empty, and iterating through the items in LIFO order.
/// This implementation uses a singly linked list with an inner class for linked list nodes.
public final class Stack<E> : Sequence {
    /// top of stack
    private var first: Node<E>? = nil
    /// size of the stack
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
    
    /// Initializes an empty stack.
    public init() {}
    
    /// Adds the item to this stack
    /// - Parameter item: the item to add
    public func push(item: E) {
        let oldFirst = first
        first = Node<E>(item: item, next: oldFirst)
        count += 1
    }
    
    /// Removes and returns the item most recently added to this stack.
    public func pop() -> E? {
        if let item = first?.item {
            first = first?.next
            count -= 1
            return item
        }
        return nil
    }
    
    /// Returns (but does not remove) the item most recently added to this stack.
    public func peek() -> E? {
        return first?.item
    }
    
    /// Returns true if this stack is empty.
    public func isEmpty() -> Bool {
        return first == nil
    }
    
    /// StackIterator that iterates over the items in LIFO order.
    public struct StackIterator<E> : IteratorProtocol {
        private var current: Node<E>?
        
        fileprivate init(_ first: Node<E>?) {
            self.current = first
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
    
    /// Returns an iterator that iterates over the items in this Stack in LIFO order.
    public __consuming func makeIterator() -> StackIterator<E> {
        return StackIterator<E>(first)
    }
}

extension Stack: CustomStringConvertible {
    public var description: String {
        return self.reduce(into: "") { $0 += "\($1) " }
    }
}

