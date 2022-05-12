//
//  demo_core_dataApp.swift
//  demo-core-data
//
//  Created by Maxim Niko on 12.05.2022.
//

import SwiftUI

@main
struct demo_core_dataApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
