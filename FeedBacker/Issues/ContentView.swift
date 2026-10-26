//
//  ContentView.swift
//  FeedBacker
//
//  Created by Jonas Mahlburg on 29.09.26.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @StateObject var viewModel: ViewModel

    init(dataController: DataController) {
        let viewModel = ViewModel(dataController: dataController)
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        List(selection: $viewModel.selectedIssue) {
            ForEach(viewModel.dataController.issuesForSelectedFilter()) { issue in
                IssueRow(issue: issue)
            }
            .onDelete(perform: viewModel.delete)
        }
        .navigationTitle("Issues")
        .searchable(
            text: $viewModel.filterText,
            tokens: $viewModel.filterTokens,
            prompt: "Filter issues, or type # to add tags") { tag in
            Text(tag.tagName)
        }
        .searchSuggestions {
            ForEach(viewModel.suggestedFilterTokens) { tag in
                Text(tag.tagName)
                    .searchCompletion(tag)
            }
        }
        .toolbar {
            ContentViewToolbar()
        }
    }
}

#Preview {
    ContentView(dataController: .preview)
}
