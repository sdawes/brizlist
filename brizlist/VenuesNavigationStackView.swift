//
//  VenuesNavigationView.swift
//  brizlist
//
//  Created by Stephen Dawes on 20/12/2023.
//

import SwiftUI

struct VenuesNavigationStackView: View {
    @ObservedObject var viewModel: VenueViewModel
    @State private var navigationPath = NavigationPath()

    var body: some View {
        NavigationStack(path: $navigationPath) {
            List(viewModel.venues) { venue in
                NavigationLink(venue.name, value: venue)
            }
            .navigationDestination(for: Venue.self) { selectedVenue in
                VenueDetailedView(venue: selectedVenue) // Navigate to VenueDetailView
            }
            .navigationBarTitle("Venues")
        }
        .onAppear {
            viewModel.fetchData() // Ensure data is fetched
        }
    }
}

struct VenuesNavigationStackView_Previews: PreviewProvider {
    static var previews: some View {
        // Initialize the VenueViewModel
        let viewModel = VenueViewModel()
        
        // Provide the VenuesNavigationStackView with the viewModel
        VenuesNavigationStackView(viewModel: viewModel)
            .onAppear {
                viewModel.fetchData() // Fetch real data when the preview appears
            }
    }
}


