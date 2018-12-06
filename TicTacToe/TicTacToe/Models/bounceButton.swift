//
//  bounceButton.swift
//  TicTacToe
//
//  Created by katty y marte on 11/14/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit
//
class bounceButton: UIButton {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 5, options: .allowUserInteraction, animations:{
            self.transform = CGAffineTransform.identity
        },completion: nil)// <-code to happen after nimation completes
        
        super.touchesBegan(touches, with: event)
    }
}
//winner should play first next
//what happens if it ends in a draw..all possible scenarios 1 or2 wins or its a draw
