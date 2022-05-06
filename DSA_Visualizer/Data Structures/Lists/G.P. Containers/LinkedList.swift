//
//  LinkedList.swift
//  DSA_Visualizer
//
//  Created by Vaughn on 2022-05-04.
//

import Foundation
import Combine

protocol Container: QueueProtocol, StackProtocol {
    func insert(val: T, at index: Int)
    func remove(at index: Int) -> T?
}

class LinkedList<T>: Container, ObservableObject {
    
    @Published private var head: Node<T>?
    private var tail: Node<T>?
    
    @Published var isEmpty: Bool = true
    
    @Published var count = 0
    
    init() {
        $head
            .map { $0 == nil }
            .assign(to: &$isEmpty)
        
        $head
            .map { head -> Int in
                var count = 0
                var tempHead = head
                
                while tempHead?.next != nil {
                    count += 1
                    tempHead = tempHead?.next
                }
                
                return count
            }.assign(to: &$count)
    }
    
    func append(val: T) {
        if isEmpty {
            head?.val = val
            tail = head
        } else {
            //Tail exists - we need to attach a new node at the end
            let newTail = Node<T>(val)
            tail?.next = newTail
            tail = newTail
        }
    }
    
    func insert(val: T, at index: Int) {
        
    }
    
    func remove(at index: Int) -> T? {
        return nil
    }
}


//MARK: - Stack
extension LinkedList {
    func push(_ val: T) {
        if isEmpty {
            let newHead = Node<T>(val)
            head = newHead
            tail = head
        } else {
            //we are putting value at head
            let newHead = Node<T>(val, next: head)
            head = newHead
        }
    }
    
    func pop() -> T? {
        if isEmpty {
            return nil
        } else {
            let returnedVal = head?.val
            head = head?.next
            
            return returnedVal
        }
    }
}
    
//MARK: - Queue
extension LinkedList {
    func enqueue(_ val: T) {
        if isEmpty {
            let newHead = Node<T>(val)
            head = newHead
            tail = head
        } else {
            //we want to add an item to the end
            tail?.next = Node<T>(val)
            tail = tail?.next
        }
    }
    
    func dequeue() -> T? {
        return self.pop()
    }
}
