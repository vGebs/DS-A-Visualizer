//
//  QueueVisualizer.swift
//  DSA_Visualizer
//
//  Created by Vaughn on 2022-05-06.
//

import SwiftUI

struct QueueVisualizer: View {
    @ObservedObject var queueViewModel = QueueViewModel()
        
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            VStack{
                HStack {
                    Text("Queue: ")
                        .font(.system(size: 30, weight: .semibold, design: .rounded))
                        .foregroundColor(.pink)
                    Text("First in, First out")
                        .font(.system(size: 20, weight: .thin, design: .rounded))
                        .foregroundColor(.white)
                    
                    Spacer()
                }
                .padding(.top)
                .padding(.leading)
                
                SliderView(slider: queueViewModel.singleKnobSlider)
                
                Button(action: {
                    withAnimation {
                        queueViewModel.enqueue()
                    }
                }) {
                    Text("ENQUEUE")
                        .font(.system(size: 35, weight: .bold, design: .rounded))
                }
                .padding()
                
                Divider()
                
                if queueViewModel.queue.count > 0 {
                    Button(action: {
                        withAnimation {
                            queueViewModel.dequeue()
                        }
                    }){
                        Text("DEQUEUE")
                            .font(.system(size: 35, weight: .bold, design: .rounded))
                    }
                }
                
                ScrollView(.vertical, showsIndicators: false) {
                    ForEach(queueViewModel.queue, id: \.self) { num in
                        Text("\(num)")
                            .font(.system(size: 22, weight: .semibold, design: .rounded))
                            .foregroundColor(.white)
                            .frame(width: screenWidth)
                            .padding(.bottom, 3)
                        Image(systemName: "chevron.up")
                            .font(.system(size: 16, weight: .semibold, design: .rounded))
                            .foregroundColor(.pink)
                            .padding(.bottom, 3)
                    }
                }
            }
        }
        .onTapGesture {
            hideKeyboard()
        }
    }
}
