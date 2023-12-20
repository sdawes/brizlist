//
//  VenueListView.swift
//  brizlist
//
//  Created by Stephen Dawes on 15/12/2023.
//

import SwiftUI

struct VenueListView: View {
    @ObservedObject var viewModel: VenueViewModel
    @State private var navigationPath = NavigationPath() // Add this line

    var body: some View {
        NavigationStack(path: $navigationPath) { // Updated to use NavigationPath
            ScrollView {
                LazyVStack(spacing: 5) {
                    if let featuredVenue = viewModel.venues.first(where: { $0.featuredVenue }) {
                        VenueFeaturedCardView(venue: featuredVenue)
                    }

                    ForEach(viewModel.venues) { venue in
                        if !venue.featuredVenue {
                            // Use a Button to navigate programmatically
                            Button(action: {
                                print("Navigating to venue: \(venue)")
                                navigationPath.append(venue)
                            }) {
                                VenueCardView(venue: venue)
                            }
                            
                        }
                    }
                }
            }
            
        }
        .background(.clear)
        .navigationDestination(for: Venue.self) { venue in
            // Define the destination view
            VenueDetailedView(venue: venue)
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




