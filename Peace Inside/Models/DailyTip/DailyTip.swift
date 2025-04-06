//
//  DailyTip.swift
//  Peace Inside
//
//  Created by Tipu Sultan on 4/7/25.
//

import Foundation

struct DailyTip: Identifiable, Codable {
    let id: UUID
    let text: String

    init(text: String) {
        self.id = UUID()
        self.text = text
    }
}
