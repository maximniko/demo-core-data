//
// Created by Maxim Niko on 12.05.2022.
//

import SwiftUI

struct ItemsView: View {
    @Environment(\.managedObjectContext) private var moc

    private let creator = ItemCreator.shared

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>

    var body: some View {
        List {
            ForEach(items) { item in
                NavigationLink {
                    ItemDetailView(item: item)
                } label: {
                    Text("Item \(item.title) \(item.timestamp, formatter: itemFormatter)")
                }
            }
                .onDelete(perform: deleteItems)
        }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
    }

    private func addItem() {
        withAnimation {
            creator.create(moc: moc)
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