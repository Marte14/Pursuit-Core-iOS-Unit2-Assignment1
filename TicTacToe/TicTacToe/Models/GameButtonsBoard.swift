//
//  GameButton.swift
//  TicTacToe
//
//  Created by Alex Paul on 11/8/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit


@IBDesignable class GameButton: bounceButton {
  @IBInspectable var row: Int = 0
  @IBInspectable var col: Int = 0
    
  @IBInspectable var borderWidth : CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    
      }
  @IBInspectable var borderColor : UIColor =  UIColor.black {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    
      }
  @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
  @IBInspectable var gameButton : Bool = false{
        didSet{
            if (gameButton)
            {
                layer.backgroundColor = UIColor.purple.cgColor
                layer.cornerRadius = 10
                layer.masksToBounds = true
                layer.borderWidth = 4
                layer.borderColor = UIColor.yellow.cgColor
            }
        }
    }
    @IBInspectable var newGameButton : Bool = false{
         didSet{
            if (newGameButton)
            {
                layer.backgroundColor = UIColor.green.cgColor
                layer.cornerRadius = 10                              //cornerRadius
                layer.masksToBounds = true                          //cornerRadius > 0
                layer.borderWidth = 3                               //borderWidth
                layer.borderColor = UIColor.black.cgColor           //borderColor.cgColor
            }
        }
    }
}
