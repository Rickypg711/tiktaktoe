//
//  GameModel.swift
//  tiktaktoe
//
//  Created by Ricardo Paredes on 7/10/23.
//

import SwiftUI

enum GameType {
    case single, bot, peer, undetermined
    
    var description: String{
        switch self {
        case .single:
            return "share ypur phoen wiht a homie"
        case .bot:
            return "play agains this iphone/ipad cpu"
        case .peer: return "play onlime wiht a person "
        case .undetermined: return ""
        }
    }
}


enum GamePiece: String {
    case x, o
    var image: Image {
        Image(self.rawValue)
    }
}


struct Player {
    let gamePiece : GamePiece
    var name:String
    var moves:[Int] = []
    var isCurrent = false
    var isWinner: Bool {
        for winningMove in Move.winningMoves {
            if winningMove.allSatisfy({ moves.contains($0) }) {
                return true
            }
        }
        return false
    }
}



enum Move {
    static var all = [1,2,3,4,5,6,7,8,9]
    
    static var winningMoves = [
    [1,2,3],
    [4,5,6],
    [7,8,9],
    [1,4,7],
    [2,5,8],
    [3,6,9],
    [1,5,9],
    [3,5,7],
    ]
}
