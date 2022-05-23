import Foundation
import CoreData

class NestedItemUpdater {
    static let shared = NestedItemUpdater()

    func update(moc: NSManagedObjectContext, id: Int64) {
        let request = NestedItem.fetchRequest()
        request.predicate = NSPredicate(format: "id == %@", String(id))
        request.fetchLimit = 1

        guard let item = try? moc.fetch(request).first else {
            print("NestedItem by id: \(id) not exists")
            return
        }
    }
}