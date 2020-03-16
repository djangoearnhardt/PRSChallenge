//
//  ContentView.swift
//  PRSChallenge
//
//  Created by Sam Lobue on 3/10/20.
//  Copyright © 2020 Sam Lobue. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var userData: UserData
        
    var body: some View {
        VStack {
            VStack {
                GameView(score: $userData.score, shouldWin: $userData.shouldWin)
            }
            
            VStack {
                ButtonView(textLabel: PossibleMoves.Throw.paper.rawValue)
                ButtonView(textLabel: PossibleMoves.Throw.rock.rawValue)
                ButtonView(textLabel: PossibleMoves.Throw.scissors.rawValue)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
