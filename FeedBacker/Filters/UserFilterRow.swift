//
//  UserFilterRow.swift
//  FeedBacker
//
//  Created by Jonas Mahlburg on 14.10.26.
//

import SwiftUI

struct UserFilterRow: View {
    var filter: Filter
    var rename: (Filter) -> Void
    var delete: (Filter) -> Void
    var body: some View {
        NavigationLink(value: filter) {
            Label(filter.name, systemImage: filter.icon)
                .badge(filter.activeIssuesCount)
                .contextMenu {
                    Button {
                        rename(filter)
                    } label: {
                        Label("Rename", systemImage: "pencil")
                    }
                    Button(role: .destructive) {
                        delete(filter)
                    } label: {
                        Label("Delete", systemImage: "trash")
                    }
                }
                .accessibilityElement()
                .accessibilityLabel(filter.name)
                .accessibilityHint("\(filter.activeIssuesCount) issue")
        }
    }
}

#Preview {
    UserFilterRow(filter: .all, rename: { _ in }, delete: { _ in })
}
