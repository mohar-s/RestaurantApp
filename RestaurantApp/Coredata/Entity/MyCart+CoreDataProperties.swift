//
//  MyCart+CoreDataProperties.swift
//  RestaurantApp
//
//  Created by Mohar on 14/12/21.
//
//

import Foundation
import CoreData


extension MyCart {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MyCart> {
        return NSFetchRequest<MyCart>(entityName: "MyCart")
    }

    @NSManaged public var cartId: String?
    @NSManaged public var title: String?
    @NSManaged public var totalPrice: String?
    @NSManaged public var cartItems: NSSet?

}

// MARK: Generated accessors for cartItems
extension MyCart {

    @objc(addCartItemsObject:)
    @NSManaged public func addToCartItems(_ value: FoodItem)

    @objc(removeCartItemsObject:)
    @NSManaged public func removeFromCartItems(_ value: FoodItem)

    @objc(addCartItems:)
    @NSManaged public func addToCartItems(_ values: NSSet)

    @objc(removeCartItems:)
    @NSManaged public func removeFromCartItems(_ values: NSSet)

}

extension MyCart : Identifiable {

}
