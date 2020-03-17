//
//  UserData.swift
//  PRSChallenge
//
//  Created by Sam Lobue on 3/10/20.
//  Copyright © 2020 Sam Lobue. All rights reserved.
//

import Foundation
import Combine

final class UserData: ObservableObject {
    @Published var competitorMove: String = "rock"
    @Published var score: Int = 0
    @Published var shouldWin: Bool = false
    @Published var game: Game = Game()
}
