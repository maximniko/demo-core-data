//
//  Item+CoreDataClass.swift
//  demo-core-data
//
//  Created by Maxim Niko on 12.05.2022.
//
//

import Foundation
import CoreData

@objc(Item)
public class Item: NSManagedObject {
    func fillFrom(i: Int) {
        id = Int64(i + 1)
        updateFrom(i: i)
    }

    func updateFrom(i: Int) {
        timestamp = Date()
        title = "Title \(i + 1)"
    }
}
