//
//  CardView.swift
//  RestaurantApp
//
//  Created by Mohar on 07/12/21.
//

import UIKit

class CardView: UIView {
    
    func makeCard() {
        self.backgroundColor = .white
        self.layer.cornerRadius = 10.0
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        self.layer.shadowRadius = 6.0
        self.layer.shadowOpacity = 0.7
        
        self.clipsToBounds = true
    }
}
