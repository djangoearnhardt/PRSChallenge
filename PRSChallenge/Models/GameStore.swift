//
//  GameStore.swift
//  PRSChallenge
//
//  Created by Sam Lobue on 3/10/20.
//  Copyright © 2020 Sam Lobue. All rights reserved.
//

import Foundation

import Combine
// MARK: Combine definition
// Apple Documentation: Customize handling of asynchronous events by combining event-processing operators.

// The Combine framework provides a declarative Swift API for processing values over time. These values can represent many kinds of asynchronous events. Combine declares publishers to expose values that can change over time, and subscribers to receive those values from the publishers.

// MARK: Conforming to @ObservableObject
// Apple Documentation: @ObservedObject A type of object with a publisher that emits before the object has changed. By default an ObservableObject synthesizes an objectWillChange publisher that emits the changed value before any of its @Published properties changes.

// GameStore is responsible for storing the state (ie: @Published vars) and providing actions to mutate that state (ie: functions). GameStore's properties keep track of the competitor's moves, the choice to win the round, the game's score, and the number of questions asked. GameStore's functions start a new round with a 'new' move, decides on the round's winning choice, and give context to the user's decision in that round.

final class GameStore: ObservableObject {
    @Published var game: Game = Game()
    @Published var competitorMove: String = ""
    @Published var score: Int = 0
    @Published var questionCount: Int = 0
    @Published var shouldWin: Bool = false
}

extension GameStore {
    /// Call a randomized move. Each time the game is reset, the game starts with a new move.
    func startWithARandomMove() -> String {
        let moves = [Move.rock.rawValue, Move.paper.rawValue, Move.scissors.rawValue]
        return moves.randomElement() ?? Move.rock.rawValue
    }
    
    /// Create a Move and the User's choice to win or lose
    func moveAndChoice() -> (String, Bool) {
        let move = game.moves[Int.random(in: 0...2)]
        let shouldWin = Bool.random()
        return (move, shouldWin)
    }
    
    /// Mutate GameStore's moves and score. Goes in circles around the moves array to find the winning move.
    func userDecisionBasedOn(competitorMove: String, shouldWin: Bool) -> String {
        
        guard let moveIndex = game.moves.firstIndex(of: competitorMove) else { return AppStrings.oops }
        if shouldWin && moveIndex == 2 {
            return game.moves[0]
        } else if shouldWin && moveIndex < 2 {
            return game.moves[moveIndex + 1]
        } else if !shouldWin && moveIndex == 0 {
            return game.moves[2]
        } else if !shouldWin && moveIndex > 0 {
            return game.moves[moveIndex - 1]
        } else {
            return AppStrings.oops
        }
    }
}
