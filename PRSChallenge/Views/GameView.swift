//
//  GameView.swift
//  PRSChallenge
//
//  Created by Sam Lobue on 3/16/20.
//  Copyright © 2020 Sam Lobue. All rights reserved.
//

import SwiftUI

struct GameView: View {
    @Binding var score: Int
    @Binding var shouldWin: Bool
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        VStack {
            if userData.score == 10 {
                Text("Your Score: " + String(userData.score))
                    .fixedSize(horizontal: false, vertical: true)
                    .frame(width: 200)
                Spacer()
                    .frame(height: 50)
            } else {
                Text("Competitor's Move: " + String(userData.competitorMove.capitalized))
                Image(userData.competitorMove)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
                Spacer()
                    .frame(height: 20)
                if shouldWin {
                    Text("Your Move: Win")
                } else {
                    Text("Your Move: Lose")
                }
                Spacer()
                    .frame(height: 50)
            }
        }
    }
}

//struct GameView_Previews: PreviewProvider {
//    static var previews: some View {
//        GameView(score: 0, shouldWin: false)
//    }
//}
