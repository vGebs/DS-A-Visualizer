//
//  QueueLinkedLists.swift
//  DSA_Visualizer
//
//  Created by Vaughn on 2022-05-05.
//

import Foundation
import Combine

class QueueLinkedList<T>: QueueProtocol, ObservableObject {
    
    
    func enqueue(_ val: T) {
        
    }
    
    func dequeue() -> T? {
        return nil
    }
}

protocol QueueP {
    associatedtype T
    func enqueue(_ val: T)
    func dequeue() -> T?
}

protocol StackP {
    associatedtype T
    func push(_ val: T)
    func pop() -> T?
}

protocol LinkedListP: StackP, QueueP {
    func insert(_ val: T, at index: Int)
    func remove(at index: Int) -> T?
}

class LinkedListt<T>: LinkedListP, ObservableObject {
    
    @Published private var head: Node<T>?
    private var tail: Node<T>?
    
    @Published var isEmpty = true
    @Published var count = 0
    
    init() {
        $head
            .map { $0 == nil }
            .assign(to: &$isEmpty)
        
        $head
            .map { head -> Int in
                var tempHead = head
                var count = 0
                while tempHead?.next != nil {
                    tempHead = tempHead?.next
                    count += 1
                }
                
                return count
            }.assign(to: &$count)
    }
    
    func insert(_ val: T, at index: Int) {
        if index <= count {
            
        } else {
            print("Index out of range")
        }
    }
    
    func remove(at index: Int) -> T? {
        return nil
    }
}

//MARK: - Stack
extension LinkedListt {
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
extension LinkedListt {
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
