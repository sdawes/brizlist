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
                NavigationLink(destination: VenueDetailedView(venue: venue)) {
                    VStack(alignment: .leading) {
                        Text(venue.name)
                            .font(.custom("UbuntuMono-Regular", size: 18))
                            .padding(.bottom, 5)
                            .foregroundColor(.primary)
                        
                        Text(venue.shortDescription)
                            .font(.custom("Roboto-Regular", size: 12))
                            .foregroundColor(Color.gray)
                            .italic()
                            .lineLimit(nil) // Allow unlimited lines
                            .multilineTextAlignment(.leading) // Align text to the leading edge
                        
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
                    // Image icon
                    AsyncImage(url: URL(string: venue.url)) { image in
                        image.resizable()
                    } placeholder: {
                        Color.gray
                    }
                    .frame(width: 60, height: 60) // Adjust size as needed
                    .cornerRadius(10)
                }
                .listRowSeparator(.hidden)
                .padding(.bottom, 1) // Adjust spacing as needed
                Divider()

            }       
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


