//
//  ButtonView.swift
//  PRSChallenge
//
//  Created by Sam Lobue on 3/11/20.
//  Copyright © 2020 Sam Lobue. All rights reserved.
//

import SwiftUI

// MARK: Helpful syntax
// Button(action: {}) {}. In SwiftUI you can easily declare an action from a button, followed by it's UI elements. It's a little different than Swift, but very convenient.

struct ButtonView: View {
    @EnvironmentObject var gameStore: GameStore
    
    var easyMode: Bool = false
    var textLabel: String
    var body: some View {
        Button(action: {
            self.tallyScore()
            debugPrint(self.gameStore.score)
        }) {
            HStack {
                ButtonIcon(name: textLabel)
                    .font(.headline)
                Text(textLabel.capitalized)
                    .font(.headline)
                    .frame(width: 100)
            }
        }
        .padding()
        .foregroundColor(.black)
        .background(Color.orange)
        .cornerRadius(40)
    }
}

extension ButtonView {
    /// Based on the User's decision, GameStore's score will stay the same, increase, or decrease.
    func tallyScore() {
        let userDecision = gameStore.userDecisionBasedOn(competitorMove: self.gameStore.competitorMove, shouldWin: self.gameStore.shouldWin)
        let moveAndChoice = gameStore.moveAndChoice()
        if userDecision == textLabel {
            self.gameStore.score += 1
        } else if textLabel == gameStore.competitorMove {
            self.gameStore.score -= 0
        } else {
            self.gameStore.score -= 0
        }
        self.gameStore.questionCount += 1
        self.gameStore.competitorMove = moveAndChoice.0
        self.gameStore.shouldWin = moveAndChoice.1
    }
    
    
}
