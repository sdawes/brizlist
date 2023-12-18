//
//  Venue.swift
//  brizlist
//
//  Created by Stephen Dawes on 15/12/2023.
//

import Foundation

struct Venue: Identifiable {
    var id: String
    var name: String
    var type: String
    var url: String
    var location: String
    var shortDescription: String
    var newEntry: Bool
    var featuredVenue: Bool

    init(id: String, name: String, type: String, url: String, location: String, shortDescription: String, newEntry: Bool, featuredVenue: Bool) {
        self.id = id
        self.name = name
        self.type = type
        self.url = url
        self.location = location
        self.shortDescription = shortDescription
        self.newEntry = newEntry
        self.featuredVenue = featuredVenue
    }
}
