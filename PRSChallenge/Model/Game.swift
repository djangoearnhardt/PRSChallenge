//
//  Game.swift
//  PRSChallenge
//
//  Created by Sam Lobue on 3/12/20.
//  Copyright © 2020 Sam Lobue. All rights reserved.
//

import SwiftUI

class Game {
    @EnvironmentObject var userData: UserData
    
    var moves: [String]
    
    init(moves: [String] = ["rock", "paper", "scissors"]) {
        self.moves = moves
    }
}

extension Game {
    
    
    func letTheGameBegin() {
        let shouldWin = Bool.random()
        let choice = Int.random(in: 0...2)
        switch choice {
        case 0:
            userData.shouldWin = shouldWin
            userData.competitorMove = "paper"
        case 1:
            userData.shouldWin = shouldWin
            userData.competitorMove = "rock"
        case 2:
            userData.shouldWin = shouldWin
            userData.competitorMove = "scissors"
        default:
            return
        }
    }
    
    func userDecision(competitorMove: String, shouldWin: Bool) -> String {
        
        guard let moveIndex = moves.firstIndex(of: competitorMove) else { return "Oops, you crashed me" }
        if shouldWin && moveIndex == 2 {
            return moves[0]
        } else if shouldWin && moveIndex < 2 {
            return moves[moveIndex + 1]
        } else if !shouldWin && moveIndex == 0 {
            return moves[2]
        } else if !shouldWin && moveIndex > 0 {
            return moves[moveIndex - 1]
        } else {
            return "Oops, you crashed me"
        }
    }


}
