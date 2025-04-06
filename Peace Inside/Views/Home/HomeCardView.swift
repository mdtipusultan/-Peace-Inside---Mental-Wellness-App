//
//  HomeCardView.swift
//  Peace Inside
//
//  Created by Tipu Sultan on 4/7/25.
//

import SwiftUI


struct HomeCardView: View {
    let title: String
    let emoji: String

    var body: some View {
        HStack {
            Text(emoji)
                .font(.largeTitle)
            Text(title)
                .font(.headline)
            Spacer()
        }
        .padding()
        .background(Color.blue.opacity(0.1))
        .cornerRadius(12)
    }
}
