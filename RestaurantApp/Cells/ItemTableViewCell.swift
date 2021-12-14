//
//  ItemTableViewCell.swift
//  RestaurantApp
//
//  Created by Mohar on 07/12/21.
//

import UIKit

class ItemTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var ratingLbl: UILabel!
    @IBOutlet weak var ratingimg: UIImageView!
    @IBOutlet weak var bgCardView: CardView!
    @IBOutlet weak var addtoCardBgView: UIView!
    @IBOutlet weak var totlaPriceLbl: UILabel!
    var addtoCardView : AddtoCartView!
    var foodItem : FoodItem!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        addtoCardView = AddtoCartView.instanceFromNib()
        addtoCardView.frame = addtoCardBgView.bounds
        addtoCardView.setDelegate(delegate: self)
        addtoCardBgView.addSubview(addtoCardView)
        addtoCardBgView.makeRound(cornerRadius: 5.0, borderColor: .gray, borderWidth: 1.0)
        bgCardView.makeCard()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCellfor(foodItem : FoodItem)  {
        MyCartDataManager.shared.fillItemfromCart(item: foodItem)
        self.foodItem = foodItem
        titleLbl.text = foodItem.title
        priceLbl.text = "\(foodItem.price)"
        addtoCardView.setCurrentCount(count: Int(foodItem.cartCount))
        self.itemImageView.image = UIImage(named: foodItem.image ?? "")
        let totalPrice = Float(self.foodItem.cartCount) * self.foodItem.price
        totlaPriceLbl?.text = "Rs".localize() + " \(totalPrice)"
//        ratingLbl?.text = foodItem
        
    }

}
extension ItemTableViewCell : AddtoCartViewProtocol {
    func userClickOnAddToCard(currentCount: Int) {
        if currentCount > 0 {
            let totalPrice = Float(currentCount) * self.foodItem.price
            totlaPriceLbl?.text = "Rs".localize() + " \(totalPrice)"
            self.foodItem.cartCount = Int16(currentCount)
            MyCartDataManager.shared.addItemInCart(item: self.foodItem)
        } else {
            totlaPriceLbl?.text = ""
            self.foodItem.cartCount = 0
            MyCartDataManager.shared.removeItemIFromCart(item: self.foodItem)
        }
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "REFRESH_CART_ITEM_VALUE"), object: nil)
    }
}
