//
//  UI_referencesApp.swift
//  UI references
//
//  Created by 이승준 on 7/4/25.
//

import SwiftUI

@main
struct UI_referencesApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
