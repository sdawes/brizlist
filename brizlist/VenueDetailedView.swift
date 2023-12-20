//
//  VenueDetailView.swift
//  brizlist
//
//  Created by Stephen Dawes on 20/12/2023.
//

import SwiftUI

struct VenueDetailedView: View {
    var venue: Venue
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(venue.name)
                .font(.title)
                .padding()
                .onAppear {
                    print("VenueDetailView loaded with venue: \(venue)")
                }
            
            Text(venue.shortDescription)
                .font(.body)
                .padding()
            
            Spacer()
        }
        .navigationBarTitle(venue.name, displayMode: .inline)
        .padding()
    }
}

// Preview Provider
struct VenueDetailView_Previews: PreviewProvider {
    static var previews: some View {
        VenueDetailedView(venue: MockData.venues[0])
    }
}
