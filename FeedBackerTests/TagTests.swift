//
//  TagTests.swift
//  FeedBackerTests
//
//  Created by Jonas Mahlburg on 16.10.26.
//

import XCTest
import CoreData
@testable import FeedBacker

final class TagTests: BaseTestCase {
    func testCreatingTagsAndIssues() {
        let count = 10

        for _ in 0..<count {
            let tag = Tag(context: managedObjectContext)

            for _ in 0..<count {
                let issue = Issue(context: managedObjectContext)
                tag.addToIssues(issue)
            }
        }

        XCTAssertEqual(dataController.count(for: Tag.fetchRequest()), count, "Expected \(count) tags.")
        XCTAssertEqual(dataController.count(for: Issue.fetchRequest()),
                       count * count, "Expected \(count * count) isues.")

    }

    func testDeletingTagDoesNotDeleteIssues() throws {
        dataController.createSampleData()

        let request = NSFetchRequest<Tag>(entityName: "Tag")
        let tags = try managedObjectContext.fetch(request)

        dataController.delete(tags[0])
        XCTAssertEqual(dataController.count(for: Tag.fetchRequest()), 4,
                       "There should be 4 tags after deleting 1 from our sample data.")
        XCTAssertEqual(dataController.count(for: Issue.fetchRequest()), 50,
                       "There should stil be 50 issues after deleting a tag from our sample data.")

    }
}
