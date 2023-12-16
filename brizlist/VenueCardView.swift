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
            HStack {
                // VStack for Info
                VStack(alignment: .leading, spacing: 5) {
                    Text(venue.name).font(.body)
                    HStack {
                        HStack(spacing: 2) {
                            Image(systemName: "location.circle.fill")
                                .foregroundColor(.darkRed)
                                .imageScale(.small)
                            Text(venue.location).font(.caption).foregroundColor(Color.darkRed)
                        }
                        HStack(spacing: 2) {
                            Image(systemName: iconForVenueType(venue.type))
                                .foregroundColor(.gray)
                                .imageScale(.small)
                            Text(venue.type).font(.caption).foregroundColor(Color.gray)
                        }
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)

                // Image icon
                AsyncImage(url: URL(string: venue.url)) { image in
                    image.resizable()
                } placeholder: {
                    Color.gray
                }
                .frame(width: 60, height: 60) // Adjust size as needed
                .clipShape(RoundedRectangle(cornerRadius: 10))
            }

            
            // Expandable part
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
