//
//  MoodTrackerView.swift
//  Peace Inside
//
//  Created by Tipu Sultan on 4/7/25.
//

import SwiftUI

struct MoodTrackerView: View {
    @StateObject var viewModel = MoodTrackerViewModel()

    var body: some View {
        VStack(spacing: 20) {
            Text("আজ আপনি কেমন অনুভব করছেন?")
                .font(.title3)
                .padding(.top)

            HStack(spacing: 15) {
                ForEach(MoodType.allCases) { mood in
                    VStack {
                        Text(mood.emoji)
                            .font(.largeTitle)
                        Text(mood.label)
                            .font(.caption)
                    }
                    .padding()
                    .background(viewModel.selectedMood == mood ? Color.blue.opacity(0.2) : Color.clear)
                    .cornerRadius(10)
                    .onTapGesture {
                        viewModel.selectedMood = mood
                    }
                }
            }

            if viewModel.selectedMood != nil {
                Text("এই অনুভূতির কারণ কী?")
                    .font(.subheadline)

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(viewModel.moodReasons, id: \.self) { reason in
                            Text(reason)
                                .padding(.horizontal)
                                .padding(.vertical, 8)
                                .background(viewModel.selectedReason == reason ? Color.green.opacity(0.2) : Color.gray.opacity(0.1))
                                .cornerRadius(15)
                                .onTapGesture {
                                    viewModel.selectedReason = reason
                                }
                        }
                    }
                }

                Button("Save Mood") {
                    viewModel.saveMood()
                }
                .buttonStyle(.borderedProminent)
                .padding(.top)
            }

            Spacer()
        }
        .padding()
    }
}

struct MoodTrackerView_Previews: PreviewProvider {
    static var previews: some View {
        MoodTrackerView()
    }
}
