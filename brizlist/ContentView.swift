//
//  ContentView.swift
//  brizlist
//
//  Created by Stephen Dawes on 15/12/2023.
//


import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = VenueViewModel() // Using VenueViewModel

    var body: some View {
        ZStack {
            Color.greenGray
                .edgesIgnoringSafeArea(.all)

            VStack(spacing: 0) { // VStack to stack the app name and the list
                AppNameView() // Add the AppNameView at the top
                VenueListView(viewModel: viewModel) // The main list view
            }
        }
        .onAppear {
            print("See Steve, this is the Content View file working")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


