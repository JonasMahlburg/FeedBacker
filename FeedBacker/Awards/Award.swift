//
//  Award.swift
//  FeedBacker
//
//  Created by Jonas Mahlburg on 11.10.26.
//

import Foundation

/// Represents a single award that can be earned by the user.
struct Award: Decodable, Identifiable {
    /// The unique identifier for the award, identical to its name.
    var id: String {
        name
    }
    /// The display name of the award.
    var name: String
    /// A description of what the award represents or how it can be earned.
    var description: String
    /// The color associated with the award, typically used for display.
    var color: String
    /// The criterion or category for earning this award.
    var criterion: String
    /// The threshold or value required to receive the award.
    var value: Int
    /// The name of the image asset representing this award.
    var image: String

    /// An array containing all awards loaded from the "Awards.json" file.
    static let allAwards = Bundle.main.decode("Awards.json", as: [Award].self)
    /// An example award, using the first entry from `allAwards`.
    static let example = allAwards[0]
}
