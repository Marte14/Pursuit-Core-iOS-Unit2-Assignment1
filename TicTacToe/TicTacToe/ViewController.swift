//
//  ViewController.swift
//  TicTacToe
//
//  Created by Alex Paul on 11/8/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var gameButtons: [GameButton]!
    
  
    @IBOutlet weak var whosTurnNow: UILabel!
    
    @IBOutlet weak var winsTrackerPlayer1: UILabel!
    @IBOutlet weak var winsTrackerPlayer2: UILabel!
    
    var p1Wins = 0
    var p2Wins = 0
    
    //keep track of the turns (players)😺
    var playerTurn = Player.player1 // instance of enum
    
    //Track the buttons that are clicked & unclicked
        //gameButton will help us track
    var gameBoardMatrix = [["","",""],
                           ["","",""],
                           ["","",""]]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Game start with \"\(playerTurn)\"")
        //whosTurnNow label sets to Player1😺
        whosTurnNow.text = "Player 1"
    }
    
    var turnPassed = 0 {
        didSet {
            if turnPassed == 9 {
                whosTurnNow.text = "It's a Draw!!!"
            }
        }
    }
    @IBAction func buttonIsPressed (_ sender: GameButton){
        var playerSymbol: String
        //display the correct image based on the turn (players) 😺
        switch playerTurn {
        case .player1:
            playerSymbol = "x"
            //change the image to x😺
            sender.setImage(UIImage(named: "x"), for: .normal)
            sender.isEnabled = false
            
            //change label to player 2😺
            whosTurnNow.text = "Player 2"
            
            //register player image in the buttons col+row
            gameBoardMatrix[sender.row][sender.col] = "x"
            
        case .player2:
            playerSymbol = "o"
            //change the image to o😺
            sender.setImage(UIImage(named: "o"), for: .normal)
            sender.isEnabled = false
            
            //register player image in the buttons col+row
            gameBoardMatrix[sender.row][sender.col] = "o"
            
            //change label to player 1😺
            whosTurnNow.text = "Player 1"
        }
        
        if checkForWins(playerSymbol: playerSymbol) {
            switch playerTurn {
            case .player1:
                whosTurnNow.text = "Player 1 has Won"
                p1Wins += 1
                winsTrackerPlayer1.text = "P1 Wins: \(p1Wins)"
                for button in gameButtons{
                    button.isEnabled = false
                }
            case .player2:
                whosTurnNow.text = "Player 2 has Won"
                p2Wins += 1
                winsTrackerPlayer2.text = "P2 Wins: \(p2Wins)"
                for button in gameButtons{
                    button.isEnabled = false
                }
            }
        }
        //check if the player wins :
            //if someone wins
                //1) change label to winning message 😺
                //2) increase the appropriate player score by 1 😺
                //3) disable all buttons 😺
        
        
        print(gameBoardMatrix)
        playerTurn.switchPlayer()
        print("Switched to \"\(playerTurn)\"")
        turnPassed += 1
    }

    @IBAction func newGameReset(_ sender: UIButton) {
        //enable the buttons again😺
        //change button images back to blank😺
        for gameButton in gameButtons {
            gameButton.isEnabled = true
            gameButton.setImage(UIImage(named: "buttonImage"), for: .normal)
        }
        turnPassed = 0
        
        //change label to player1 😺
        whosTurnNow.text = "Player 1"
        
        //empty out board
        gameBoardMatrix = [["","",""],
                           ["","",""],
                           ["","",""]]
         print(gameBoardMatrix)
        
    }
   
    
    func checkForWins(playerSymbol: String) -> Bool {
        //Horizontal
        for arr in gameBoardMatrix {
            var matchNum = 0
            for symbol in arr {
                if symbol == playerSymbol { matchNum += 1 }
            }
            if matchNum == 3 { return true}
        }
        
        //Vertical
        //row index change by 1, column index remains the same
        //for loop
        for columnNum in 0..<gameBoardMatrix.count {
            var matchNum = 0
            for rowNum in 0..<gameBoardMatrix.count {
                if gameBoardMatrix[rowNum][columnNum] == playerSymbol { matchNum += 1 }
            }
             if matchNum == 3 { return true}
        }
        
        
        //Diagonal
        if (gameBoardMatrix[0][0] == playerSymbol && gameBoardMatrix[1][1] == playerSymbol && gameBoardMatrix[2][2] == playerSymbol) ||
            (gameBoardMatrix[0][2] == playerSymbol && gameBoardMatrix[1][1] == playerSymbol && gameBoardMatrix[2][0] == playerSymbol) {
            return true
        }
        
        
        return false
    }
    
}

