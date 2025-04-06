//
//  JournalViewModel.swift
//  Peace Inside
//
//  Created by Tipu Sultan on 4/7/25.
//

import Foundation
import Foundation

class JournalViewModel: ObservableObject {
    @Published var entries: [JournalEntry] = []
    @Published var currentText: String = ""
    @Published var selectedMood: MoodType? = nil

    private let storageKey = "journal_entries"

    init() {
        loadEntries()
    }

    func saveEntry() {
        guard !currentText.isEmpty else { return }

        let newEntry = JournalEntry(
            date: Date(),
            text: currentText,
            mood: selectedMood
        )

        entries.insert(newEntry, at: 0)
        currentText = ""
        selectedMood = nil
        saveToUserDefaults()
    }

    private func saveToUserDefaults() {
        if let encoded = try? JSONEncoder().encode(entries) {
            UserDefaults.standard.set(encoded, forKey: storageKey)
        }
    }

    private func loadEntries() {
        if let data = UserDefaults.standard.data(forKey: storageKey),
           let decoded = try? JSONDecoder().decode([JournalEntry].self, from: data) {
            self.entries = decoded
        }
    }
}
