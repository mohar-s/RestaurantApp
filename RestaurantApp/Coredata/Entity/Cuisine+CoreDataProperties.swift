//
//  Cuisine+CoreDataProperties.swift
//  RestaurantApp
//
//  Created by Mohar on 14/12/21.
//
//

import Foundation
import CoreData


extension Cuisine {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Cuisine> {
        return NSFetchRequest<Cuisine>(entityName: "Cuisine")
    }

    @NSManaged public var details: String?
    @NSManaged public var image: String?
    @NSManaged public var title: String?
    @NSManaged public var cuisineID: Int16
    @NSManaged public var items: NSSet?

}

// MARK: Generated accessors for items
extension Cuisine {

    @objc(addItemsObject:)
    @NSManaged public func addToItems(_ value: FoodItem)

    @objc(removeItemsObject:)
    @NSManaged public func removeFromItems(_ value: FoodItem)

    @objc(addItems:)
    @NSManaged public func addToItems(_ values: NSSet)

    @objc(removeItems:)
    @NSManaged public func removeFromItems(_ values: NSSet)

}

extension Cuisine : Identifiable {

}
