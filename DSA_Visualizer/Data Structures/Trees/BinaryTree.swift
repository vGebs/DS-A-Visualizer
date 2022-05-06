//
//  BinaryTree.swift
//  DSA_Visualizer
//
//  Created by Vaughn on 2022-05-05.
//

import Foundation
import Combine

protocol BinaryTreeProtocol {
    associatedtype T
    func insert(_ val: T)
}

class BinaryTree<T: Comparable>: BinaryTreeProtocol {
    
    @Published private var root: BinaryNode<T>?
    
    @Published var isEmpty = true
    
    init() {
        $root
            .map { $0 == nil }
            .assign(to: &$isEmpty)
    }
    
    func insert(_ val: T) {
        if isEmpty {
            root = BinaryNode<T>(val)
        } else {
            
        }
    }
}
