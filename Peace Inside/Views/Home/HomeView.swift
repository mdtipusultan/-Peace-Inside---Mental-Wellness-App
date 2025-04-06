//
//  HomeView.swift
//  Peace Inside
//
//  Created by Tipu Sultan on 4/7/25.
//

import SwiftUI

struct HomeView: View {
    @StateObject var homeVM = HomeViewModel()

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    // Greeting
                    Text("\(homeVM.greeting) \(homeVM.userName)!")
                        .font(.title)
                        .bold()

                    Text(homeVM.todayDateFormatted)
                        .font(.subheadline)
                        .foregroundColor(.gray)

                    // Mood Quick Access
                    NavigationLink(destination: MoodTrackerView()) {
                        HomeCardView(title: "আজকের মুড শেয়ার করুন", emoji: "🙂")
                    }

                    NavigationLink(destination: JournalView()) {
                        HomeCardView(title: "মনের কথা লিখুন", emoji: "📝")
                    }

                    NavigationLink(destination: BreathingView()) {
                        HomeCardView(title: "নিঃশ্বাস অনুশীলন করুন", emoji: "🧘‍♂️")
                    }

                    // Daily Tip/Dua
//                    VStack(alignment: .leading, spacing: 10) {
//                        Text("আজকের উপদেশ")
//                            .font(.headline)
//                        Text("🕊️ দুশ্চিন্তায় আল্লাহর উপর ভরসা করুন।")
//                            .padding()
//                            .background(Color.yellow.opacity(0.2))
//                            .cornerRadius(10)
                        DailyTipView()

                    //}

                    // Ad Placeholder
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.gray.opacity(0.2))
                        .frame(height: 60)
                        .overlay(Text("AdMob Banner"))
                }
                .padding()
            }
            .navigationBarHidden(true)
        }
    }
}

