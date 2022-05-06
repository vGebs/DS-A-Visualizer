//
//  StackViewModel.swift
//  DSA_Visualizer
//
//  Created by Vaughn on 2022-05-05.
//

import Foundation
import Combine

class StackViewModel: ObservableObject {
    @Published var value = "" {
        didSet {
            let filtered = value.filter { $0.isNumber }
            
            if value != filtered {
                value = filtered
            }
        }
    }
    
    @Published private var stack_ = Stack<Int>()
    @Published private(set) var stack: [Int] = []
    
    private var subs: [AnyCancellable] = []
    
    init() {
        stack_.$stack
            .sink { [weak self] stack in
                self?.stack = stack
            }.store(in: &subs)
    }
    
    func push() {
        if !value.isEmpty {
            if let num = Int(value) {
                stack_.push(num)
                value = ""
            }
        }
    }
    
    func pop() {
        let _ = stack_.pop()
    }
}
