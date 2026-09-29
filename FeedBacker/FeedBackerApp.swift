//
//  FeedBackerApp.swift
//  FeedBacker
//
//  Created by Jonas Mahlburg on 29.09.26.
//

import SwiftUI
import CoreData

@main
struct FeedBackerApp: App {
    @StateObject var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            NavigationSplitView{
                SidebarView()
            } content: {
                ContentView()
            } detail: {
                DetailView()
            }
            .environment(\.managedObjectContext, dataController.container.viewContext)
            .environmentObject(dataController)

        }
    }
}
