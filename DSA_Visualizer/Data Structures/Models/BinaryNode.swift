//
//  BinaryNode.swift
//  DSA_Visualizer
//
//  Created by Vaughn on 2022-05-05.
//

import Foundation

class BinaryNode<T> {
    var val: T
    var right: BinaryNode?
    var left: BinaryNode?
    
    public init(_ val: T, right: BinaryNode? = nil, left: BinaryNode? = nil) {
        self.val = val
        self.right = right
        self.left = left
    }
}
