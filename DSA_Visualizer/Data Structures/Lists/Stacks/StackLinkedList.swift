//
//  StackLinkedList.swift
//  DSA_Visualizer
//
//  Created by Vaughn on 2022-05-05.
//

import Foundation
import Combine

class StackLinkedList<T>: StackProtocol, ObservableObject {
    
    @Published private var head: Node<T>?
    private var tail: Node<T>?
    
    @Published var isEmpty: Bool = true
    
    private var count = 0
    
    init() {
        $head
            .map { $0 == nil }
            .assign(to: &$isEmpty)
    }
    
    func push(_ val: T) {
        if isEmpty {
            head = Node<T>(val)
            tail = head
            count += 1
        } else {
            //we add to head
            let newHead = Node<T>(val, next: head)
            head = newHead
            count += 1
        }
    }
    
    func pop() -> T? {
        if isEmpty {
            return nil
        } else {
            //we need to return the head and then discard of it
            let returningVal = head?.val
            head = head?.next
            return returningVal
        }
    }
}
