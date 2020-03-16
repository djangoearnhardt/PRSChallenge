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
                Spacer()
                    .frame(height: 20)
            } else {
                Text("Competitor's Move: " + String(userData.competitorMove))
                Spacer()
                    .frame(height: 20)
                if shouldWin {
                    Text("You should win")
                } else {
                    Text("You should lose")
                }
                Spacer()
                    .frame(height: 100)
            }
        }
    }
}

//struct GameView_Previews: PreviewProvider {
//    static var previews: some View {
//        GameView(score: 0, shouldWin: false)
//    }
//}
