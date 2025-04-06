//
//  DailyTipViewModel.swift
//  Peace Inside
//
//  Created by Tipu Sultan on 4/7/25.
//

import Foundation

class DailyTipViewModel: ObservableObject {
    @Published var todayTip: DailyTip?

    private let tipKey = "shownTipDate"
    private let tipDataKey = "shownTipData"

    init() {
        loadTodayTip()
    }

    func loadTodayTip() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let today = formatter.string(from: Date())

        if let savedDate = UserDefaults.standard.string(forKey: tipKey),
           savedDate == today,
           let savedTip = UserDefaults.standard.data(forKey: tipDataKey),
           let decoded = try? JSONDecoder().decode(DailyTip.self, from: savedTip) {
            self.todayTip = decoded
        } else {
            let newTip = DailyTipData.tips.randomElement()!
            self.todayTip = newTip
            UserDefaults.standard.set(today, forKey: tipKey)
            if let encoded = try? JSONEncoder().encode(newTip) {
                UserDefaults.standard.set(encoded, forKey: tipDataKey)
            }
        }
    }
}
