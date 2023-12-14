//
//  localShare_AppApp.swift
//  localShare_App
//
//  Created by ahmed casual on 12/7/23.
//

import SwiftUI

@main
struct localShare_AppApp: App {
    
    @StateObject private var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
