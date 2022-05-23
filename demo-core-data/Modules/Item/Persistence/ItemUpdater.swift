//
// Created by Maxim Niko on 12.05.2022.
//

import Foundation
import CoreData

class ItemUpdater {
    static let shared = ItemUpdater()

    func update(moc: NSManagedObjectContext, id: Int64) {
        let request = Item.fetchRequest()
        request.predicate = NSPredicate(format: "id == %@", String(id))
        request.fetchLimit = 1

        guard let item = try? moc.fetch(request).first else {
            print("Item by id: \(id) not exists")
            return
        }


    }
}