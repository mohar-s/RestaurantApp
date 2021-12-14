//
//  CartButtonView.swift
//  RestaurantApp
//
//  Created by Mohar on 13/12/21.
//

import UIKit

class CartButtonView: UIView {
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var itemCountLbl: UILabel!
    @IBOutlet weak var payNowLbl: UILabel!

    func setPrice(price : Float) {
        priceLbl.text = "\(price)"
    }
    
    func setItemCout(itemCount : Int)  {
        itemCountLbl.text = "\(itemCount)"
    }
}
