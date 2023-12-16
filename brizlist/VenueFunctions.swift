//
//  VenueFunctions.swift
//  brizlist
//
//  Created by Stephen Dawes on 16/12/2023.
//

import Foundation
import SwiftUI

func iconForVenueType(_ type: String) -> String {
    switch type.lowercased() {
    case "pub":
        return "mappin.and.ellipse" // 'p' for pub, using a filled circle for emphasis
    case "restaurant":
        return "fork.knife.circle.fill" // Fork and knife inside a circle for restaurants
    case "shop":
        return "bag.fill" // A shopping bag, commonly used to represent shops
    case "coffee shop":
        return "cup.and.saucer.fill" // Cup and saucer, ideal for coffee shops
    default:
        return "questionmark.circle" // Default icon for unknown types
    }
}
