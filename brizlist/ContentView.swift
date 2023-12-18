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
            VenueListView(viewModel: viewModel) // Passing the VenueViewModel instance
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


