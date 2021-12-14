//
//  ViewExt.swift
//  KidsGame
//
//  Created by Mohar on 23/09/20.
//  Copyright © 2020 MoharSingh. All rights reserved.
//

import UIKit

extension UIView {
    func makeRound(cornerRadius : CGFloat , borderColor : UIColor , borderWidth : CGFloat = 1.0 ) {
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = borderWidth
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = true
        self.layoutIfNeeded()
    }
    
}

