//
//  VenueOfTheWeek.swift
//  brizlist
//
//  Created by Stephen Dawes on 16/12/2023.
//

import SwiftUI

struct VenueOfTheWeekView: View {
    var venue: Venue

    var body: some View {
        VStack {
            Text("Venue of the Week").font(.headline)
            // Add more details about the venue
            Text(venue.name).font(.title)
            // ... other details you want to include
        }
        .padding()
        .background(Color.blue) // Customize as needed
        .cornerRadius(10)
    }
}

// Preview Provider
struct VenueOfTheWeekView_Previews: PreviewProvider {
    static var previews: some View {
        VenueOfTheWeekView(venue: MockData.venues.first!) // Assuming there's at least one venue in your mock data
            .previewLayout(.sizeThatFits)
    }
}
