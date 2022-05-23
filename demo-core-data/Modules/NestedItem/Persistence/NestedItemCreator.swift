//
// Created by Maxim Niko on 12.05.2022.
//

import Foundation
import CoreData

class NestedItemCreator {
    static let shared = NestedItemCreator()

    func create(moc: NSManagedObjectContext, i: Int? = nil) -> NestedItem {
        let newNestedItem = NestedItem(context: moc)
        newNestedItem.fillFrom(i: i ?? Int.random(in: 100...200))
        return newNestedItem
    }

    func save(moc: NSManagedObjectContext) {
        do {
            try moc.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
}