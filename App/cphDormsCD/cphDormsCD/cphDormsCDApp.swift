//
//  cphDormsCDApp.swift
//  cphDormsCD
//
//  Created by Niclas Lach on 25.04.21.
//

import SwiftUI

@main
struct cphDormsCDApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
//                .environmentObject(ContentModel())
        }
    }
}
