//
//  BreathingView.swift
//  Peace Inside
//
//  Created by Tipu Sultan on 4/7/25.
//

import SwiftUI

struct BreathingView: View {
    @StateObject private var viewModel = BreathingViewModel()
    @State private var animate = false

    var body: some View {
        VStack(spacing: 40) {
            Text("শ্বাসের অনুশীলন")
                .font(.title)
                .bold()

            ZStack {
                Circle()
                    .fill(Color.blue.opacity(0.2))
                    .frame(width: animate ? 200 : 100, height: animate ? 200 : 100)
                    .animation(.easeInOut(duration: 4), value: animate)

                Text(viewModel.phase.rawValue)
                    .font(.headline)
            }
            .onChange(of: viewModel.phase) { _ in
                if viewModel.phase == .inhale || viewModel.phase == .exhale {
                    animate.toggle()
                }
            }

            Button(viewModel.isRunning ? "বন্ধ করুন" : "শুরু করুন") {
                viewModel.isRunning ? viewModel.stop() : viewModel.start()
            }
            .buttonStyle(.borderedProminent)

            Spacer()
        }
        .padding()
    }
}
