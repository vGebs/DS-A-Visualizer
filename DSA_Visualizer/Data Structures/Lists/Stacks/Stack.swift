//
//  Stack.swift
//  DSA_Visualizer
//
//  Created by Vaughn on 2022-05-04.
//

import Foundation
import Combine

protocol StackProtocol {
    associatedtype T
        
    func push(_ val: T)
    func pop() -> T?
}

class Stack<T>: StackProtocol, ObservableObject {
    @Published private(set) var stack: [T] = []

    @Published private(set) var count: Int = 0
    
    init() {
        $stack
            .map { $0.count }
            .assign(to: &$count)
    }
    
    func push(_ val: T) {
        stack.append(val)
    }
    
    func pop() -> T? {
        return stack.popLast()
    }
}
