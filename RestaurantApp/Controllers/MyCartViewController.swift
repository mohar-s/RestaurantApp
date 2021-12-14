//
//  MyCartViewController.swift
//  RestaurantApp
//
//  Created by Mohar on 13/12/21.
//

import UIKit

class MyCartViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    var foodList = [FoodItem]()
    var myCart : MyCart? = nil
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Cart".localize()
        
        myCart = MyCartDataManager.shared.getCurrentCart()
        if let item = myCart?.cartItems?.allObjects as? [FoodItem] {
            foodList = item
        }
        tableView.reloadData()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

    }
    
    @objc override func refreshCartInfo()  {
        super.refreshCartInfo()
        myCart = MyCartDataManager.shared.getCurrentCart()
        if let item = myCart?.cartItems?.allObjects as? [FoodItem] {
            foodList = item
        }
        tableView.reloadData()
    }
    
    
    @IBAction override func gotoMyCartView(_ sender: Any) {
        let cart = MyCartDataManager.shared.getCurrentCart()
        if let count = cart.cartItems?.count, count > 0 {
            let okAction = UIAlertAction(title: "Ok".localize(), style: .default, handler: nil)
            let alert = UIAlertController(title: title, message: "Thank you adding the Items in the Cart".localize(), preferredStyle: .alert)
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)
        } else {
            let okAction = UIAlertAction(title: "Ok".localize(), style: .default, handler: nil)
            let alert = UIAlertController(title: title, message: "Cart is Empty".localize(), preferredStyle: .alert)
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)
        }
    }

}


extension MyCartViewController : UITableViewDelegate , UITableViewDataSource {
 
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerCell = self.tableView.dequeueReusableCell(withIdentifier: "HomeResturantNameCellIdentifer") as! HomeHeaderViewCell
        headerCell.titleLbl.text = "Cart Items".localize()

        return headerCell
    }
 
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerCell = self.tableView.dequeueReusableCell(withIdentifier: "cartTotalTableCellIdentifier") as! CardTotalTableViewCell
        
        footerCell.totalPricelbl.text = "\(MyCartDataManager.shared.getCartTotal())"
        footerCell.grandTotalPricelbl.text = "\(MyCartDataManager.shared.getCartGrandTotalValue())"
        footerCell.sgstPricelbl.text = "\(MyCartDataManager.shared.getCartSGSTValue())"
        footerCell.cgstPricelbl.text = "\(MyCartDataManager.shared.getCartCGSTValue())"
        
        return footerCell
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 200
    }
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return foodList.count
       
    }
 
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell : ItemTableViewCell = tableView.dequeueReusableCell(withIdentifier: "HomeItemTableCellIdentifier", for: indexPath) as! ItemTableViewCell
        cell.bgCardView.makeCard()
        let foodItem = foodList[indexPath.row]
        cell.setupCellfor(foodItem: foodItem)

        return cell
        
        
    }
            
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 100
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
    

}
