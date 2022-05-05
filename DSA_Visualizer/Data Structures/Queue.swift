//
//  Queue.swift
//  DSA_Visualizer
//
//  Created by Vaughn on 2022-05-04.
//

import Foundation
import Combine

protocol QueueProtocol {
    associatedtype T
    func enqueue(val: T)
    func dequeue() -> T?
}

class Queue<T>: QueueProtocol, ObservableObject {
    
    @Published private var queue: [T] = []
    
    func enqueue(val: T) {
        queue.append(val)
    }
    
    func dequeue() -> T? {
        return queue.remove(at: 0)
    }
}
