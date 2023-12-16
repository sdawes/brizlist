//
//  MockData.swift
//  brizlist
//
//  Created by Stephen Dawes on 16/12/2023.
//

import Foundation

struct MockData {
    static let venues = [
        Venue(id: "1", name: "The Local Pub", type: "Pub", url: "http://example.com/pub"),
        Venue(id: "2", name: "Gourmet Bistro", type: "Restaurant", url: "http://example.com/bistro"),
        Venue(id: "3", name: "City Concert Hall", type: "Music Venue", url: "http://example.com/concert")
        // Add more venues as needed
    ]
}
