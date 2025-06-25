//
//  CountdownTimerView.swift
//  CountdownTimerCombine
//
//  Created by 仲優樹 on 2025/06/25.
//

import SwiftUI

struct CountdownTimerView: View {
    @StateObject private var viewModel = CountdownTimerViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            Text("⏱ カウントダウンタイマー")
                .font(.title)
            
            TextField("秒数を入力", text: $viewModel.inputSeconds)
                .keyboardType(.numberPad)
                .padding()
                .border(Color.gray)
                .disabled(viewModel.isRunning)
            
            Text("残り時間: \(viewModel.remainingSeconds) 秒")
                .font(.title2)
            
            HStack {
                Button("開始") {
                    viewModel.startCountdown()
                }
                .disabled(viewModel.isRunning || viewModel.inputSeconds.isEmpty)
                
                Button("停止") {
                    viewModel.stopCountdown()
                }
                .disabled(!viewModel.isRunning)
            }
            .padding()
        }
        .padding()
    }
}

#Preview {
    CountdownTimerView()
}
