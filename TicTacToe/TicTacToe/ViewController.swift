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
    
    @IBAction func buttonIsPressed (_ sender: GameButton){
        //display the correct image based on the turn (players) 😺
        switch playerTurn {
        case .player1:
            //change the image to x😺
            sender.setImage(UIImage(named: "x"), for: .normal)
            sender.isEnabled = false
            //change label to player 2😺
            whosTurnNow.text = "Player 2"
            
            //register player image in the buttons col+row
            //save x into the array as per its col and row index numbers
            //id which button pressed gamebutton[0][]
            //i have access to gameButton members it is sender.row and sender.col
            //append?
            //fetch the id
            
            gameBoardMatrix.insert(["x"], at: sender.col)
            print(gameBoardMatrix)
            
        case .player2:
            //change the image to o😺
            sender.setImage(UIImage(named: "o"), for: .normal)
            sender.isEnabled = false
            //change label to player 1😺
            whosTurnNow.text = "Player 1"
            
        //register player image in the buttons col+row
            //gameBoardMatrix.insert(["o"], at: sender.col)
            sender.
            gameBoardMatrix.append(sender.row)
            print(gameBoardMatrix)
        }
        
        //method to check whether a player wins ***hardest***(last)
            //if someone wins / draw
                //1) change label to winning message
                //2) increase the appropriate player score by 1
                //3) disable all buttons
        
        playerTurn.switchPlayer()
        print("Switched to \"\(playerTurn)\"")
    }

    @IBAction func newGameReset(_ sender: UIButton) {
        //enable the buttons again😺
        //change button images back to blank😺
        for gameButton in gameButtons {
            gameButton.isEnabled = true
            gameButton.setImage(UIImage(named: "buttonImage"), for: .normal)
        }
        
        //change label to player1 😺
        whosTurnNow.text = "Player 1"
        
        //empty out board
        gameBoardMatrix = [["","",""],
                           ["","",""],
                           ["","",""]]
    }
    
}

