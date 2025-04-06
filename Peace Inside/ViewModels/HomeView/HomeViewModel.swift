//
//  HomeViewModel.swift
//  Peace Inside
//
//  Created by Tipu Sultan on 4/7/25.
//

import Foundation

class HomeViewModel: ObservableObject {
    var greeting: String {
        let hour = Calendar.current.component(.hour, from: Date())
        switch hour {
        case 5..<12: return "সুপ্রভাত!"
        case 12..<17: return "শুভ দুপুর!"
        case 17..<20: return "শুভ সন্ধ্যা!"
        default: return "শুভ রাত্রি!"
        }
    }

    var userName: String {
        return "Sultan" // পরবর্তীতে UserSettings থেকে আসবে
    }

    var todayDateFormatted: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter.string(from: Date())
    }
}
