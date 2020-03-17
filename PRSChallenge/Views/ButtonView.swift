//
//  ButtonView.swift
//  PRSChallenge
//
//  Created by Sam Lobue on 3/11/20.
//  Copyright © 2020 Sam Lobue. All rights reserved.
//

import SwiftUI

struct ButtonView: View {
    @EnvironmentObject var userData: UserData

    var textLabel: String
    var body: some View {
        Button(action: {
            self.tallyScore()
            debugPrint(self.userData.score)
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

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(textLabel: "Buttoned")
    }
}

extension ButtonView {
    func resetGame() -> (String, Bool) {
        let move = userData.game.moves[Int.random(in: 0...2)]
        let shouldWin = Bool.random()
        return (move, shouldWin)
    }
    
    func tallyScore() {
        let decision = userData.game.userDecision(competitorMove: self.userData.competitorMove, shouldWin: self.userData.shouldWin)
        if decision == textLabel {
            self.userData.score += 1
            let reset = self.resetGame()
            self.userData.competitorMove = reset.0
            self.userData.shouldWin = reset.1
        } else {
            self.userData.score -= 1
            let reset = self.resetGame()
            self.userData.competitorMove = reset.0
            self.userData.shouldWin = reset.1
        }
    }
}
