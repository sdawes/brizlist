//
//  Venue.swift
//  brizlist
//
//  Created by Stephen Dawes on 15/12/2023.
//

struct Venue: Identifiable, Hashable {
    var id: String
    var name: String
    var type: String
    var url: String
    var location: String
    var shortDescription: String
    var isNew: Bool
    var isFeatured: Bool

    init(id: String, name: String, type: String, url: String, location: String, shortDescription: String, isNew: Bool, isFeatured: Bool) {
        self.id = id
        self.name = name
        self.type = type
        self.url = url
        self.location = location
        self.shortDescription = shortDescription
        self.isNew = isNew
        self.isFeatured = isFeatured
    }
}

