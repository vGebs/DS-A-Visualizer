//
//  StackVisualizer.swift
//  DSA_Visualizer
//
//  Created by Vaughn on 2022-05-05.
//

import Foundation
import SwiftUI

struct StackVisualizer: View {
    @StateObject var stackViewModel = StackViewModel()
        
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            VStack{
                HStack {
                    Text("Stack: ")
                        .font(.system(size: 25, weight: .semibold, design: .rounded))
                        .foregroundColor(.pink)
                    Text("First in, Last out")
                        .font(.system(size: 20, weight: .regular, design: .rounded))
                        .foregroundColor(.white)
                    
                    Spacer()
                }
                .padding(.top)
                .padding(.leading)
                
                HStack {
                    Text("Enter a number: ")
                        .font(.system(size: 18, weight: .regular, design: .rounded))
                        .foregroundColor(.white)
                    
                    TextField("Input", text: $stackViewModel.value)
                        .keyboardType(.decimalPad)
                        .padding()
                    
                    Button(action: {
                        withAnimation {
                            stackViewModel.push()
                        }
                    }) {
                        Text("PUSH")
                            .font(.system(size: 18, weight: .regular, design: .rounded))
                    }
                }
                .padding(.leading)
                
                if stackViewModel.stack.count > 0 {
                    Button(action: {
                        withAnimation {
                            stackViewModel.pop()
                        }
                    }){
                        Text("POP")
                            .font(.system(size: 35, weight: .bold, design: .rounded))
                    }
                }
                
                ScrollView(.vertical, showsIndicators: false) {
                    ForEach(stackViewModel.stack.reversed(), id: \.self) { num in
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

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
