//
//  JournalEntry.swift
//  Peace Inside
//
//  Created by Tipu Sultan on 4/7/25.
//

import Foundation

struct JournalEntry: Identifiable, Codable {
    let id: UUID
    let date: Date
    let text: String
    let mood: MoodType?

    init(id: UUID = UUID(), date: Date, text: String, mood: MoodType?) {
        self.id = id
        self.date = date
        self.text = text
        self.mood = mood
    }
}
