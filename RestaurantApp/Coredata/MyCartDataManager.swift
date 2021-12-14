//
//  MyCartDataManager.swift
//  RestaurantApp
//
//  Created by Mohar on 13/12/21.
//

import UIKit
import CoreData

class MyCartDataManager: NSObject {

    static let SGST = 2.5
    static let CGST = 2.5
    
    
    static let shared = MyCartDataManager()
    var myCart : MyCart? = nil
    func getCurrentCart() -> MyCart {
        if let cart = myCart {
            return cart
        }
        
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "MyCart")

        var cartList: [MyCart]!
        CoreDataManager.sharedInstance.fetchModel(request: fetchRequest,
            result: { (records: [NSManagedObject]) -> () in
                cartList = records as? [MyCart]
                print("conversationList Count \(cartList.count)")
            })
        
        if let list = cartList , list.count > 0 {
            myCart = list.first! as MyCart
            return myCart!
        }
        
        myCart = CoreDataManager.sharedInstance.insertNewModel(name: "MyCart") as? MyCart
        return myCart!
        
    }
    
    func getCartTotal() -> Double {
        var price = 0.0
        if myCart == nil {
            return price
        }
        if let allItems = myCart!.cartItems?.allObjects as? [FoodItem] {
            for item in allItems {
                price = price + Double(item.price * Float(item.cartCount))
            }
        }
        return price
    }
    
    func getCartSGSTValue() -> Double {
        let total = getCartTotal()
        let sgstValue = (total * MyCartDataManager.SGST) / 100
        return sgstValue
    }
    
    func getCartCGSTValue() -> Double {
        let total = getCartTotal()
        let sgstValue = (total * MyCartDataManager.CGST) / 100
        return sgstValue
    }
    
    func getCartGrandTotalValue() -> Double {
        let total = getCartTotal()
        let sgst = getCartSGSTValue()
        let cgst = getCartCGSTValue()
        let totalValue = total + sgst + cgst
        return totalValue
    }
    
    
    func getCartItemCount() -> Int {
        var itemCount = 0
        if myCart == nil {
            return itemCount
        }
        
        if let allItems = myCart!.cartItems?.allObjects as? [FoodItem] {
            for item in allItems {
                itemCount = itemCount + Int(item.cartCount)
            }
        }
        return itemCount
    }
    
    func fillItemfromCart(item : FoodItem)  {
        if let alradyAdded = myCart?.getFoodItemfor(forID: item.itemID) {
            item.cartCount = alradyAdded.cartCount
        }
    }
    func addItemInCart(item : FoodItem)  {
        if myCart == nil {
            myCart = getCurrentCart()
        }
        
        if let alradyAdded = myCart?.getFoodItemfor(forID: item.itemID) {
            alradyAdded.cartCount = item.cartCount
        } else {
            myCart?.addToCartItems(item)
        }
    }
    
    
    func deleteCart()  {
        if let cart = myCart {
            CoreDataManager.sharedInstance.privateManagedObjectContext.delete(cart)
            CoreDataManager.sharedInstance.savePrivateContext()
        }
        
        myCart = nil
    }
    
    func removeItemIFromCart(item : FoodItem)  {
        if myCart == nil {
            return
        }
        if let alradyAdded = myCart?.getFoodItemfor(forID: item.itemID) {
            alradyAdded.cartCount = 0
            myCart?.removeFromCartItems(alradyAdded)
        }
        
    }
    
}
