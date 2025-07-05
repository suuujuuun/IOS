//
//  Kyle_DictionaryApp.swift
//  Kyle Dictionary
//
//  Created by 이승준 on 7/5/25.
//

import SwiftUI

@main
struct Kyle_DictionaryApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
