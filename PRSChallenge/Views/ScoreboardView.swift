//
//  ScoreboardView.swift
//  PRSChallenge
//
//  Created by Sam Lobue on 3/16/20.
//  Copyright © 2020 Sam Lobue. All rights reserved.
//

import SwiftUI

struct ScoreboardView: View {
    
    @EnvironmentObject var gameStore: GameStore
    
    var body: some View {
        VStack {
            if gameStore.questionCount == 10 {
                Text(AppStrings.yourScore + String(gameStore.score))
                    .fixedSize(horizontal: false, vertical: true)
                    .frame(width: 200)
                Spacer()
                    .frame(height: 50)
            } else {
                Text(AppStrings.competitorsMove + String(gameStore.competitorMove.capitalized))
                Image(gameStore.competitorMove)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
                Spacer()
                    .frame(height: 20)
                if gameStore.shouldWin {
                    Text(AppStrings.youShouldWin)
                } else {
                    Text(AppStrings.youShouldLose)
                }
                Spacer()
                    .frame(height: 50)
            }
        }
    }
}
