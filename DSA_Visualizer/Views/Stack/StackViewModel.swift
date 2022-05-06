//
//  StackViewModel.swift
//  DSA_Visualizer
//
//  Created by Vaughn on 2022-05-05.
//

import Foundation
import Combine

class StackViewModel: ObservableObject {    
    @Published private var stack_ = Stack<Int>()
    @Published private(set) var stack: [Int] = []
    
    @Published var singleKnobSlider = CustomSlider(start: 0, end: 1000, doubleKnob: false)
    
    init() {
        stack_.$stack
            .map { $0 }
            .assign(to: &$stack)
    }
    
    func push() {
        let currentVal = Int(singleKnobSlider.highHandle.currentValue)
        var duplicate = false
        
        for num in stack {
            if currentVal == num {
                duplicate = true
            }
        }
        
        if !duplicate {
            stack_.push(currentVal)
        }
    }
    
    func pop() {
        let _ = stack_.pop()
    }
}
