//
//  NestedItem+CoreDataClass.swift
//  demo-core-data
//
//  Created by Maxim Niko on 12.05.2022.
//
//

import Foundation
import CoreData

@objc(NestedItem)
public class NestedItem: NSManagedObject {
    func fillFrom(i: Int) {
        id = Int32(i + 1)
        updateFrom(i: i)
    }

    func updateFrom(i: Int) {
        title = "Nested Title \(i + 1)"
    }
}
