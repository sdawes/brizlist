//
//  VenueFeaturedCardView.swift
//  brizlist
//
//  Created by Stephen Dawes on 18/12/2023.
//

import SwiftUI

struct VenueFeaturedCardView: View {
    var venue: Venue
    
    // Define the rainbow gradient
    let rainbowGradient = LinearGradient(
        gradient: Gradient(colors: [.red, .orange, .yellow, .green, .blue, .indigo, .purple]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                // VStack for Info
                VStack(alignment: .leading, spacing: 5) {
                    Text(venue.name)
                        .font(.custom("UbuntuMono-Regular", size: 18))
                        .padding(.bottom, 5)
                    
                    if venue.newEntry {
                        Text("new")
                            .font(.custom("UbuntuMono-Regular", size: 12))
                            .foregroundColor(.red)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 2)
                            .background(Color.yellow)
                            .cornerRadius(4)
                    }
                    
                    if venue.featuredVenue {
                        Text("featured")
                            .font(.custom("UbuntuMono-Regular", size: 12))
                            .foregroundColor(.blue)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 2)
                            .background(Color.green)
                            .cornerRadius(4)
                    }
                    
                    Text(venue.shortDescription)
                        .font(.custom("Roboto-Regular", size: 12))
                        .foregroundColor(Color.gray)
                        .italic()
                        .padding(.bottom, 5)
                    HStack {
                        HStack(spacing: 2) {
                            Image(systemName: "location.circle.fill")
                                .foregroundColor(.gray)
                                .imageScale(.small)
                            Text(venue.location)
                                .font(.custom("Roboto-Regular", size: 12))
                                .foregroundColor(Color.gray)
                        }
                        HStack(spacing: 2) {
                            Image(systemName: iconForVenueType(venue.type))
                                .foregroundColor(.gray)
                                .imageScale(.small)
                            Text(venue.type)
                                .font(.custom("Roboto-Regular", size: 12))
                                .foregroundColor(Color.gray)
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
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(0)
        .overlay(
            RoundedRectangle(cornerRadius: 0)
                .stroke(rainbowGradient, lineWidth: 2)
        )
        .padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20))
    }
}

struct VenueFeaturedCardView_Previews: PreviewProvider {
    static var previews: some View {
        VenueFeaturedCardView(venue: MockData.venues[0])
    }
}