//
//  BreathingViewModel.swift
//  Peace Inside
//
//  Created by Tipu Sultan on 4/7/25.
//

import Foundation
import Combine

class BreathingViewModel: ObservableObject {
    @Published var phase: BreathingPhase = .inhale
    @Published var isRunning: Bool = false

    private var timer: Timer?
    private var phaseIndex = 0
    private let phases: [(BreathingPhase, TimeInterval)] = [
        (.inhale, 4),
        (.hold, 2),
        (.exhale, 4),
        (.hold, 2)
    ]

    func start() {
        isRunning = true
        phaseIndex = 0
        updatePhase()
    }

    func stop() {
        isRunning = false
        timer?.invalidate()
    }

    private func updatePhase() {
        let (currentPhase, duration) = phases[phaseIndex]
        phase = currentPhase

        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: duration, repeats: false) { _ in
            self.phaseIndex = (self.phaseIndex + 1) % self.phases.count
            self.updatePhase()
        }
    }
}

enum BreathingPhase: String {
    case inhale = "শ্বাস নিন"
    case hold = "রাখুন"
    case exhale = "শ্বাস ছাড়ুন"
}
