//
//  SidebarView.swift
//  FeedBacker
//
//  Created by Jonas Mahlburg on 29.09.26.
//

import SwiftUI
import CoreData

struct SidebarView: View {
    @EnvironmentObject var dataController: DataController
    let smartFilter: [Filter] = [.all, .recent]
    @FetchRequest(sortDescriptors: [SortDescriptor(\.name)]) var tags: FetchedResults<Tag>
    @State private var tagToRename: Tag?
    @State private var renameingTag = false
    @State private var tagName = ""
    var tagFilters: [Filter] {
        tags.map { tag in
            Filter(id: tag.tagID, name: tag.tagName, icon: "tag", tag: tag)
        }
    }
    var body: some View {
        List(selection: $dataController.selectedFilter) {
            Section("Smart Filters") {
                ForEach(smartFilter, content: SmartFilterRow.init)
            }
            Section("Tags") {
                ForEach(tagFilters) { filter in
                    UserFilterRow(filter: filter, rename: rename, delete: delete)
                }
                .onDelete(perform: delete)
            }
        }
        .toolbar {
            SidebarViewToolbar()
        }
        .alert("Rename tag", isPresented: $renameingTag) {
            Button("OK", action: completeRename)
            Button("Cancel", role: .cancel) { }
            TextField("New name", text: $tagName)
        }
        .navigationTitle("Filters")
    }
    // MARK: - Delete methods

    // delete Tag with swipe
    func delete(_ offsets: IndexSet) {
        for offset in offsets {
            let item = tags[offset]
            dataController.delete(item)
        }
    }

    // delete Tags in context Menu
    func delete(_ filter: Filter) {
        guard let tag = filter.tag else { return }
        dataController.delete(tag)
        dataController.save()
    }
    // MARK: - Tag Rename

    func rename(_ filter: Filter) {
        tagToRename = filter.tag
        tagName = filter.name
        renameingTag = true
    }

    func completeRename() {
        tagToRename?.name = tagName
        dataController.save()
    }
}

#Preview {
    SidebarView()
        .environmentObject(DataController.preview)
}
