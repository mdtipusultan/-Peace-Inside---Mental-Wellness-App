//
//  MoodTrackerViewModel.swift
//  Peace Inside
//
//  Created by Tipu Sultan on 4/7/25.
//

import Foundation

//class MoodTrackerViewModel: ObservableObject {
//    @Published var selectedMood: MoodType? = nil
//    @Published var selectedReason: String = ""
//    @Published var moodEntries: [MoodEntry] = []
//
//    let moodReasons = [
//        "পরিবার", "কাজ", "শরীর খারাপ", "উৎসাহ", "আল্লাহর উপর ভরসা"
//    ]
//
//    func saveMood() {
//        guard let mood = selectedMood else { return }
//        let newEntry = MoodEntry(date: Date(), mood: mood, reason: selectedReason)
//        moodEntries.append(newEntry)
//        selectedMood = nil
//        selectedReason = ""
//    }
//}
class MoodTrackerViewModel: ObservableObject {
    @Published var selectedMood: MoodType? = nil
    @Published var selectedReason: String = ""
    @Published var moodEntries: [MoodEntry] = [] {
        didSet {
            saveToUserDefaults()
        }
    }

    let moodReasons = [
        "পরিবার", "কাজ", "শরীর খারাপ", "উৎসাহ", "আল্লাহর উপর ভরসা"
    ]

    private let storageKey = "saved_mood_entries"

    init() {
        loadFromUserDefaults()
    }

    func saveMood() {
        guard let mood = selectedMood else { return }
        let newEntry = MoodEntry(date: Date(), mood: mood, reason: selectedReason)
        moodEntries.insert(newEntry, at: 0) // latest on top
        selectedMood = nil
        selectedReason = ""
    }

    private func saveToUserDefaults() {
        if let encoded = try? JSONEncoder().encode(moodEntries) {
            UserDefaults.standard.set(encoded, forKey: storageKey)
        }
    }

    private func loadFromUserDefaults() {
        if let data = UserDefaults.standard.data(forKey: storageKey),
           let decoded = try? JSONDecoder().decode([MoodEntry].self, from: data) {
            self.moodEntries = decoded
        }
    }
}
