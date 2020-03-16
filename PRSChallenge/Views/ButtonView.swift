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
    
    var game: Game = Game()
    
    var textLabel: String
    var body: some View {
        Button(action: {
            switch self.game.userDecision(competitorMove: self.userData.competitorMove, shouldWin: self.userData.shouldWin)  {
            case self.textLabel:
                self.userData.score += 1
                let reset = self.resetGame()
                self.userData.competitorMove = reset.0
                self.userData.shouldWin = reset.1
            default:
                self.userData.score -= 1
                let reset = self.resetGame()
                self.userData.competitorMove = reset.0
                self.userData.shouldWin = reset.1
            }
        }) {
            HStack {
                ButtonIcon(name: textLabel)
                    .font(.headline)
                Text(textLabel)
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
        let move = self.game.moves[Int.random(in: 0...2)]
        let shouldWin = Bool.random()
        return (move, shouldWin)
    }
}
