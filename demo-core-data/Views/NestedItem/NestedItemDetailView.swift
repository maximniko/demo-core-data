//
// Created by Maxim Niko on 12.05.2022.
//

import SwiftUI

struct NestedItemDetailView: View {
    @Environment(\.managedObjectContext) private var moc
    @State private var edit = false

    init(item: NestedItem) {
        self.item = item
        title = item.title
    }

    @State private var title: String

    let item: NestedItem
    var body: some View {
        VStack {
            Text("Nested Item \(item.title)")
        }
            .sheet(isPresented: $edit, content: {
                NavigationView {
                    Form {
                        TextField("Title", text: $title)
                            .textInputAutocapitalization(.never)
                            .disableAutocorrection(true)
                            .textFieldStyle(.roundedBorder)
                    }
                        .onDisappear(perform: {
                            if title.count > 0 && title != item.title {
                                item.title = title
                                save()
                            }
                        })
                        .toolbar {
                            ToolbarItem {
                                Button(action: { edit = false }) {
                                    Text("Close")
                                }
                            }
                        }
                }
            })
            .toolbar {
                ToolbarItem {
                    Button(action: {
                        edit = true
                    }) {
                        Text("Edit")
                    }
                }
            }
    }

    private func save() {
        if moc.hasChanges {
            do {
                try moc.save()
                print("saved")
                title = ""
            } catch {
                moc.rollback()
                print("rollback")
            }
        }
    }
}