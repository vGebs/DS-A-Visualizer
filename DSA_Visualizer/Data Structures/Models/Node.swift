//
//  Node.swift
//  DSA_Visualizer
//
//  Created by Vaughn on 2022-05-05.
//

import Foundation

class Node<T> {
    var val: T
    var next: Node?
    
    public init(_ val: T, next: Node? = nil) {
        self.val = val
        self.next = next
    }
}

extension Node: CustomStringConvertible {
    public var description: String {
        guard let next = next else {
            return "\(val)"
        }
        return "\(val) -> " + String(describing: next) + " "
    }
}
