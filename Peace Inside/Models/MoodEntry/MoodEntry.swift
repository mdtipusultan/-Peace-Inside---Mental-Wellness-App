//
//  MoodEntry.swift
//  Peace Inside
//
//  Created by Tipu Sultan on 4/7/25.
//

import Foundation

enum MoodType: String, CaseIterable, Identifiable, Codable {
    case happy, neutral, sad, stressed

    var id: String { self.rawValue }

    var emoji: String {
        switch self {
        case .happy: return "🙂"
        case .neutral: return "😐"
        case .sad: return "🙁"
        case .stressed: return "😫"
        }
    }

    var label: String {
        switch self {
        case .happy: return "ভাল লাগছে"
        case .neutral: return "সাধারণ"
        case .sad: return "দুঃখিত"
        case .stressed: return "চিন্তিত"
        }
    }
}

struct MoodEntry: Identifiable, Codable {
    let id: UUID
    let date: Date
    let mood: MoodType
    let reason: String?
    
    init(id: UUID = UUID(), date: Date, mood: MoodType, reason: String?) {
        self.id = id
        self.date = date
        self.mood = mood
        self.reason = reason
    }
}
