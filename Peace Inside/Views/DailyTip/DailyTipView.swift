//
//  DailyTipView.swift
//  Peace Inside
//
//  Created by Tipu Sultan on 4/7/25.
//

import Foundation
import SwiftUI

struct DailyTipView: View {
    @StateObject private var tipVM = DailyTipViewModel()

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("📖 আজকের উপদেশ")
                .font(.headline)
            if let tip = tipVM.todayTip {
                Text(tip.text)
                    .padding()
                    .background(Color.green.opacity(0.2))
                    .cornerRadius(10)
            }
        }
        .padding()
    }
}
