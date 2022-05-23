//
//  NestedItem+CoreDataProperties.swift
//  demo-core-data
//
//  Created by Maxim Niko on 12.05.2022.
//
//

import Foundation
import CoreData


extension NestedItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<NestedItem> {
        return NSFetchRequest<NestedItem>(entityName: "NestedItem")
    }

    @NSManaged public var id: Int32
    @NSManaged public var title: String
    @NSManaged public var item: Item

}

extension NestedItem : Identifiable {

}
