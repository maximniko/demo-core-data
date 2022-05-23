//
//  Item+CoreDataProperties.swift
//  demo-core-data
//
//  Created by Maxim Niko on 12.05.2022.
//
//

import Foundation
import CoreData


extension Item {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
        return NSFetchRequest<Item>(entityName: "Item")
    }

    @NSManaged public var timestamp: Date
    @NSManaged public var title: String
    @NSManaged public var id: Int64
    @NSManaged public var nestedItems: Set<NestedItem>

}

// MARK: Generated accessors for nestedItems
extension Item {

    @objc(addNestedItemsObject:)
    @NSManaged public func addToNestedItems(_ value: NestedItem)

    @objc(removeNestedItemsObject:)
    @NSManaged public func removeFromNestedItems(_ value: NestedItem)

    @objc(addNestedItems:)
    @NSManaged public func addToNestedItems(_ values: NSSet)

    @objc(removeNestedItems:)
    @NSManaged public func removeFromNestedItems(_ values: NSSet)

}

extension Item : Identifiable {

}
