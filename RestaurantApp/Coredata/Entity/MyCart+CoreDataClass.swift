//
//  MyCart+CoreDataClass.swift
//  RestaurantApp
//
//  Created by Mohar on 13/12/21.
//
//

import Foundation
import CoreData

@objc(MyCart)
public class MyCart: NSManagedObject {

    func getFoodItemfor(forID : Int16) -> FoodItem? {
        if let items = self.cartItems?.allObjects as? [FoodItem] {
            for item in items {
                if item.itemID == forID {
                    return item
                }
            }
        }
        return nil
    }
}
