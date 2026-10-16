//
//  AssetTests.swift
//  FeedBackerTests
//
//  Created by Jonas Mahlburg on 16.10.26.
//

import XCTest
@testable import FeedBacker

final class AssetTests: XCTestCase {
    func testColorsExist() {
        let allColors = ["Award_Dark Blue", "Award_Dark Gray", "Award_Gold", "Award_Gray", "Award_Green",
        "Award_Light Blue", "Award_Midnight", "Award_Orange", "Award_Pink", "Award_Purple", "Award_Red", "Award_Teal"]

        for color in allColors {
            XCTAssertNotNil(UIColor(named: color), "Failed to load color '\(color)' from asset catalog.")
        }
    }

    func testAwardsLoadCorrectly() {
        XCTAssertTrue(Award.allAwards.isEmpty == false, "Failed to load awards from JSON.")
    }
}
