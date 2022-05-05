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
        
    func push(val: T)
    func pop() -> T?
}

class Stack<T>: StackProtocol, ObservableObject {
    @Published private var stack: [T] = []

    func push(val: T) {
        stack.append(val)
    }
    
    func pop() -> T? {
        return stack.popLast()
    }
}
