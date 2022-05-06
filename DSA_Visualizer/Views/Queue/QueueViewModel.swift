//
//  QueueViewModel.swift
//  DSA_Visualizer
//
//  Created by Vaughn on 2022-05-06.
//

import Foundation
import Combine
import SwiftUI

class QueueViewModel: ObservableObject {
    
    
    @Published private var queue_ = Queue<Int>()
    @Published private(set) var queue: [Int] = []
    @Published var singleKnobSlider = CustomSlider(start: 0, end: 1000, doubleKnob: false)

    init() {
        queue_.$queue
            .map { $0 }
            .assign(to: &$queue)
    }
    
    func enqueue() {
        let currentVal = Int(singleKnobSlider.highHandle.currentValue)
        var duplicate = false
        
        for num in queue {
            if currentVal == num {
                duplicate = true
            }
        }
        
        if !duplicate {
            queue_.enqueue(currentVal)
        }
    }
    
    func dequeue() {
        let _ = queue_.dequeue()
    }
}
