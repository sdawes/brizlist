//
//  VenueListView.swift
//  brizlist
//
//  Created by Stephen Dawes on 15/12/2023.
//

import SwiftUI

struct VenueListView: View {
    @ObservedObject var viewModel: VenueViewModel
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(spacing: 5) {
                    // Display the featured venue card at the top if it exists
                    if let featuredVenue = viewModel.venues.first(where: { $0.featuredVenue }) {
                        VenueFeaturedCardView(venue: featuredVenue)
                    }
                    
                    // Display the rest of the venues
                    ForEach(viewModel.venues) { venue in
                        if !venue.featuredVenue {
                            NavigationLink(destination: VenueDetailView(venue: venue)) {
                                VenueCardView(venue: venue)
                            }
                        }
                    }
                }
            }
            .background(Color.greenGray) // Set background color for the stack
        }
        
    }
}

// Preview
struct VenueListView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.greenGray
                .edgesIgnoringSafeArea(.all)
            VenueListView(viewModel: VenueViewModel())
        }
        .previewLayout(.sizeThatFits)
    }
}




