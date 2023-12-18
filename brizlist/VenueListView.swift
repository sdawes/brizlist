//
//  VenueView.swift
//  brizlist
//
//  Created by Stephen Dawes on 15/12/2023.
//

import SwiftUI

struct VenueListView: View {
    @ObservedObject private var viewModel = VenueViewModel()

    var body: some View {
        ScrollView {
            LazyVStack(spacing: 10) {
                ForEach(viewModel.venues) { venue in
                    VenueCardView(venue: venue)
                }
            }
        }
        .onAppear() {
            self.viewModel.fetchData()
        }
    }
}


struct VenueListView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.gray.opacity(0.1) // Replace with your desired color
                .edgesIgnoringSafeArea(.all) // Ensures the color extends to the preview's edges

            VenueListView()
        }
        .previewLayout(.sizeThatFits) // Adjusts the preview layout
    }
}

