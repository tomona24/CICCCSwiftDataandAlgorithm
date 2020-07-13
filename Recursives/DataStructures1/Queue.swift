//
//  Queue.swift
//  DataStructures1
//
//  Created by Tomona Sako on 2020/07/12.
//  Copyright © 2020 Tomona Sako. All rights reserved.
//

import Foundation

public final class Queue<E> : Sequence {
    private var head: Node<E>? = nil
    private var tail: Node<E>? = nil
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
        return head == nil
    }
    
    public func enqueue(item: E) {
        if isEmpty() {
            head = E
            tail = E
        } else {
            head?.next = E
            tail = E
        }
        count += 1
    }
    
    public func dequeue() -> E?{
        if !isEmpty() {
            let oldHead = head
            head = oldHead?.next
            count -= 1
            return oldHead
        }
        return nil
    }

    public func peek() -> E?{
        if !isEmpty() {
            return head
        }
        return nil
    }
    
    
    /// BagIterator that iterates over the items in this bag in arbitrary order. (reverse order)
    public struct QueueIterator<E> : IteratorProtocol {
        private var current: Node<E>?
        
        fileprivate init(_ head: Node<E>?) {
            self.current = head
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
    public func makeIterator() -> QueueIterator<E> {
        return QueueIterator<E>(first)
    }
}

extension Queue: CustomStringConvertible {
    public var description: String {
        return self.reduce(into: "") { $0 += "\($1), "}
    }
}
