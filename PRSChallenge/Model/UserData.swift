//
//  UserData.swift
//  PRSChallenge
//
//  Created by Sam Lobue on 3/10/20.
//  Copyright © 2020 Sam Lobue. All rights reserved.
//

import Foundation

final class UserData: ObservableObject {
    @Published var move: PossibleMoves.Throw?
}
