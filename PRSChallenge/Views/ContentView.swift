//
//  ContentView.swift
//  PRSChallenge
//
//  Created by Sam Lobue on 3/10/20.
//  Copyright © 2020 Sam Lobue. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var gameStore: GameStore
    
    var body: some View {
        VStack {
            VStack {
                ScoreboardView()
            }
            VStack {
                if gameStore.questionCount == 10 {
                    Button(action: { self.gameStore.score = 0; self.gameStore.questionCount = 0 }) {
                        Text(AppStrings.playAgain)
                            .padding()
                        .foregroundColor(.black)
                        .background(Color.orange)
                        .cornerRadius(40)
                    }
                    
                } else {
                    ButtonView(textLabel: Move.paper.rawValue)
                    ButtonView(textLabel: Move.rock.rawValue)
                    ButtonView(textLabel: Move.scissors.rawValue)
                    
                }
            }
        }
    }
}
