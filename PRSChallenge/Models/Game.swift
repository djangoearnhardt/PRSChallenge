//
//  Game.swift
//  PRSChallenge
//
//  Created by Sam Lobue on 3/12/20.
//  Copyright © 2020 Sam Lobue. All rights reserved.
//

import SwiftUI

class Game : ObservableObject {
    
    var moves: [String]
    
    init(moves: [String] = [Move.rock.rawValue, Move.paper.rawValue, Move.scissors.rawValue]) {
        self.moves = moves
    }
}
