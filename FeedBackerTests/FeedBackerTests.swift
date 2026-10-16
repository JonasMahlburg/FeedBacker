//
//  FeedBackerTests.swift
//  FeedBackerTests
//
//  Created by Jonas Mahlburg on 16.10.26.
//

import CoreData
import XCTest
@testable import FeedBacker

class BaseTestCase: XCTestCase {
    var dataController: DataController!
    var managedObjectContext: NSManagedObjectContext!

    override func setUpWithError() throws {
        dataController = DataController(inMemory: true)
        managedObjectContext = dataController.container.viewContext
    }
}
