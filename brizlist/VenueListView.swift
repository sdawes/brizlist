//
//  VenueListView.swift
//  brizlist
//
//  Created by Stephen Dawes on 15/12/2023.
//

import SwiftUI

struct VenueListView: View {
    @ObservedObject var viewModel: VenueViewModel // Updated to VenueViewModel

    var body: some View {
        ScrollView {
            LazyVStack(spacing: 10) {
                ForEach(viewModel.venues) { venue in
                    VenueCardView(venue: venue)
                }
            }
        }
    }
}

struct VenueListView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.greenGray
                .edgesIgnoringSafeArea(.all)
            VenueListView(viewModel: VenueViewModel()) // Updated to VenueViewModel
        }
        .previewLayout(.sizeThatFits)
    }
}



