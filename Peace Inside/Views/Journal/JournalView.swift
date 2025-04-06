//
//  JournalView.swift
//  Peace Inside
//
//  Created by Tipu Sultan on 4/7/25.
//

import SwiftUI

struct JournalView: View {
    @StateObject private var viewModel = JournalViewModel()

    var body: some View {
        VStack(spacing: 20) {
            Text("আপনার মনের কথা লিখুন")
                .font(.title3)
                .padding(.top)

            TextEditor(text: $viewModel.currentText)
                .frame(height: 150)
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(MoodType.allCases) { mood in
                        Text(mood.emoji)
                            .font(.title)
                            .padding()
                            .background(viewModel.selectedMood == mood ? Color.blue.opacity(0.2) : Color.clear)
                            .cornerRadius(10)
                            .onTapGesture {
                                viewModel.selectedMood = mood
                            }
                    }
                }
            }

            Button("Save Entry") {
                viewModel.saveEntry()
            }
            .buttonStyle(.borderedProminent)

            Divider()

            List(viewModel.entries) { entry in
                VStack(alignment: .leading, spacing: 5) {
                    HStack {
                        if let mood = entry.mood {
                            Text(mood.emoji)
                        }
                        Text(entry.date, style: .date)
                    }
                    Text(entry.text)
                        .font(.body)
                }
                .padding(.vertical, 4)
            }

            Spacer()
        }
        .padding()
    }
}

