//
// Created by Maxim Niko on 12.05.2022.
//

import SwiftUI

struct NestedItemsView: View {
    @Environment(\.managedObjectContext) private var moc
    private let creator = NestedItemCreator.shared

    let item: Item

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \NestedItem.id, ascending: true)],
        animation: .default)
    private var items: FetchedResults<NestedItem>

    var body: some View {
        VStack {
            Button(action: addItem) {
                Label("Add Nested Item", systemImage: "plus")
            }
            List {
                ForEach(items) { item in
                    NavigationLink {
                        NestedItemDetailView(item: item)
                    } label: {
                        Text("Nested Item \(item.title)")
                    }
                }
                    .onDelete(perform: deleteItems)
            }
        }
    }

    private func addItem() {
        withAnimation {
            let nestedItem = creator.create(moc: moc)
            nestedItem.item = item
            creator.save(moc: moc)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map {
                    items[$0]
                }
                .forEach(moc.delete)

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
}