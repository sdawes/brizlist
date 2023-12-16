//
//  VenueCardView.swift
//  brizlist
//
//  Created by Stephen Dawes on 16/12/2023.
//

import SwiftUI

struct VenueCardView: View {
    var venue: Venue

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(venue.name).font(.headline)
            Text(venue.type).font(.subheadline)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

struct VenueCardView_Previews: PreviewProvider {
    static var previews: some View {
        VenueCardView(venue: MockData.venues[0])
    }
}
