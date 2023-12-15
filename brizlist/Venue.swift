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

    init(id: String, name: String, type: String, url: String) {
        self.id = id
        self.name = name
        self.type = type
        self.url = url
    }
}
