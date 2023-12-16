//
//  MockData.swift
//  brizlist
//
//  Created by Stephen Dawes on 16/12/2023.
//

import Foundation

struct MockData {
    static let venues = [
        Venue(id: "1", name: "The Local Pub", type: "Pub", url: "https://firebasestorage.googleapis.com/v0/b/brizlist-11839.appspot.com/o/icon_root.jpg?alt=media&token=53c40d8a-d089-4bfc-82d1-761391ed5946"),
        Venue(id: "2", name: "Gourmet Bistro", type: "Restaurant", url: "https://firebasestorage.googleapis.com/v0/b/brizlist-11839.appspot.com/o/icon_cheese_company.jpg?alt=media&token=7c23b36f-e081-40c7-8362-a6dd41bea660"),
        Venue(id: "3", name: "City Concert Hall", type: "Music Venue", url: "https://firebasestorage.googleapis.com/v0/b/brizlist-11839.appspot.com/o/icon_bookshop.jpg?alt=media&token=d28ccde8-70a4-46f3-ba93-cda85b45cd59")
        // Add more venues as needed
    ]
}
