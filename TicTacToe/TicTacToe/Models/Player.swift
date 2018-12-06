//
//  Player.swift
//  TicTacToe
//
//  Created by katty y marte on 12/5/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation

enum Player {
    case player1
    case player2
    
    mutating func switchPlayer(){
        switch self {
        case Player.player1:
                self = Player.player2
        case Player.player2:
                self = Player.player1
        }
    }
}

