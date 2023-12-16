//
//  VenueView.swift
//  brizlist
//
//  Created by Stephen Dawes on 15/12/2023.
//

import SwiftUI

struct VenueView: View {
    @ObservedObject private var viewModel = VenueViewModel()

    var body: some View {
        List(viewModel.venues) { venue in
            VenueCardView(venue: venue)
        }
        .onAppear() {
            self.viewModel.fetchData()
        }
    }
}


struct VenueView_Previews: PreviewProvider {
    static var previews: some View {
        VenueView()
    }
}

