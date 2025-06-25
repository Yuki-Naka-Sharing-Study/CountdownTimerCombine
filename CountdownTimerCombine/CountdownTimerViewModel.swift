//
//  CountdownTimerViewModel.swift
//  CountdownTimerCombine
//
//  Created by 仲優樹 on 2025/06/25.
//

import Foundation
import Combine

class CountdownTimerViewModel: ObservableObject {
    @Published var inputSeconds: String = ""
    @Published var remainingSeconds: Int = 0
    @Published var isRunning = false
    
    private var timerCancellable: AnyCancellable?
    
    func startCountdown() {
        guard let seconds = Int(inputSeconds), seconds > 0 else {
            return
        }
        
        remainingSeconds = seconds
        isRunning = true
        
        timerCancellable = Timer
            .publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                guard let self = self else { return }
                if self.remainingSeconds > 0 {
                    self.remainingSeconds -= 1
                } else {
                    self.stopCountdown()
                }
            }
    }
    
    func stopCountdown() {
        timerCancellable?.cancel()
        timerCancellable = nil
        isRunning = false
    }
}
