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
            Text(venue.name).font(.headline)
            Text(venue.type).font(.subheadline)

            if isExpanded {
                // Load and display the image from the URL
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
        .background(Color.white)
        .cornerRadius(10)
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
