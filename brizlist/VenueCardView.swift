//
//  VenueCardView.swift
//  brizlist
//
//  Created by Stephen Dawes on 16/12/2023.
//

import SwiftUI

struct VenueCardView: View {
    var venue: Venue
    @State private var isExpanded: Bool = false

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(venue.name)
                .font(.headline)
                .frame(maxWidth: .infinity, alignment: .leading) // Aligns text to the left

            Text(venue.type)
                .font(.subheadline)
                .frame(maxWidth: .infinity, alignment: .leading) // Aligns text to the left

            if isExpanded {
                AsyncImage(url: URL(string: venue.url)) { image in
                    image.resizable()
                } placeholder: {
                    Color.gray
                }
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity)
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .onTapGesture {
            withAnimation {
                isExpanded.toggle()
            }
        }
    }
}

struct VenueCardView_Previews: PreviewProvider {
    static var previews: some View {
        VenueCardView(venue: MockData.venues[0])
    }
}
