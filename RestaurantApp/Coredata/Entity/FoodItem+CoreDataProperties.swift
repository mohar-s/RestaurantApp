//
//  FoodItem+CoreDataProperties.swift
//  RestaurantApp
//
//  Created by Mohar on 14/12/21.
//
//

import Foundation
import CoreData


extension FoodItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FoodItem> {
        return NSFetchRequest<FoodItem>(entityName: "FoodItem")
    }

    @NSManaged public var detail: String?
    @NSManaged public var image: String?
    @NSManaged public var price: Float
    @NSManaged public var title: String?
    @NSManaged public var itemID: Int16
    @NSManaged public var cartCount: Int16

}

extension FoodItem : Identifiable {

}
