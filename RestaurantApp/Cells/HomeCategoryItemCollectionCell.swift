//
//  HomeCategoryItemCollectionCell.swift
//  RestaurantApp
//
//  Created by Mohar on 07/12/21.
//

import UIKit

class HomeCategoryItemCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var itemIV: UIImageView!
    @IBOutlet weak var bgCardView: CardView!
    @IBOutlet weak var titleLbl: UILabel!
    
    
    func setupCellfor(cuisine : Cuisine)  {
        titleLbl.text = cuisine.title
        itemIV.image = UIImage(named: cuisine.image ?? "")
    }
    
}
