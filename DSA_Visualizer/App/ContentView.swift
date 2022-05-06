//
//  ContentView.swift
//  DSA_Visualizer
//
//  Created by Vaughn on 2022-05-04.
//

import SwiftUI

struct ContentView: View {
    
    @State var currentPage: CGFloat = 0
    
    var body: some View {
        
        GeometryReader { proxy in
            let rect = proxy.frame(in: .global)
            
            Pager(tabs: tabs, rect: rect, offset: $currentPage) {
                
                HStack(spacing: 0){
                    StackVisualizer()
                        .frame(width: screenWidth)
                    QueueVisualizer()
                        .frame(width: screenWidth)
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

let tabs = ["Stack", "Queue"]
