//
//  NoIssueView.swift
//  FeedBacker
//
//  Created by Jonas Mahlburg on 01.10.26.
//

import SwiftUI
import CoreData

struct NoIssueView: View {
    @EnvironmentObject var dataController: DataController
    
    var body: some View {
        Text("No Issue Selected")
            .font(.title)
            .foregroundStyle(.secondary)
        
        Button("New Issue", action: dataController.newIssue)
    }
}

#Preview {
    NoIssueView()
}
