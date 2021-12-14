//
//  BaseViewController.swift
//  RestaurantApp
//
//  Created by Mohar on 13/12/21.
//

import UIKit

class BaseViewController: UIViewController {
    
    @IBOutlet weak var cartView: CartButtonView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        refreshCartInfo()
        NotificationCenter.default.addObserver(self, selector: #selector(refreshCartInfo), name: NSNotification.Name(rawValue: "REFRESH_CART_ITEM_VALUE"), object: nil)
    }
    

    //MARK: IBAction Methods
    @IBAction func gotoMyCartView(_ sender: Any) {
        let cart = MyCartDataManager.shared.getCurrentCart()
        if let count = cart.cartItems?.count, count > 0 {
            let cartDetailsView = self.storyboard!.instantiateViewController(withIdentifier: "MyCartViewController_SB_ID") as! MyCartViewController
            self.navigationController?.pushViewController(cartDetailsView, animated: true)
        } else {
            let okAction = UIAlertAction(title: "Ok".localize(), style: .default, handler: nil)
            let alert = UIAlertController(title: title, message: "Cart is Empty".localize(), preferredStyle: .alert)
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @objc func refreshCartInfo()  {
        let cart = MyCartDataManager.shared.getCurrentCart()
        if let count = cart.cartItems?.count, count > 0 {
            cartView.itemCountLbl.isHidden = false
            cartView.payNowLbl?.isHidden = false
            let price = MyCartDataManager.shared.getCartGrandTotalValue()
            let itemCount = MyCartDataManager.shared.getCartItemCount()
            cartView.itemCountLbl.text = "\(itemCount) " + "items".localize()
            cartView.priceLbl.text =  "Rs".localize() + " : \(price)"
            
        } else {
            cartView.payNowLbl?.isHidden = true
            cartView.itemCountLbl.isHidden = true
            cartView.priceLbl.text = "Empty Cart".localize()
        }
    }

}
