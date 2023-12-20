//
//  VenueDetailView.swift
//  brizlist
//
//  Created by Stephen Dawes on 20/12/2023.
//

import SwiftUI

struct VenueDetailView: View {
    var venue: Venue
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(venue.name)
                .font(.title)
                .padding()
            
            Text(venue.shortDescription)
                .font(.body)
                .padding()
            
            Spacer()
        }
        .navigationBarTitle(venue.name, displayMode: .inline)
        .padding()
    }
}

