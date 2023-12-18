//
//  VenueListView.swift
//  brizlist
//
//  Created by Stephen Dawes on 15/12/2023.
//

import SwiftUI

struct VenueListView: View {
    @ObservedObject var viewModel: VenueModel
    
    init(viewModel: VenueModel) {
        self.viewModel = viewModel
    }

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
            Color.greenGray
                .edgesIgnoringSafeArea(.all)

            VenueListView(viewModel: VenueModel()) // Pass the existing ViewModel instance
        }
        .previewLayout(.sizeThatFits) // Adjusts the preview layout
    }
}



