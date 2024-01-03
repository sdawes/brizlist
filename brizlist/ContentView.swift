//
//  ContentView.swift
//  brizlist
//
//  Created by Stephen Dawes on 15/12/2023.
//


import SwiftUI

struct ContentView: View {
    @ObservedObject var venueViewModel = VenueViewModel()
    
    var body: some View {
        VStack(spacing: 0) {
            AppNameView()
            NavigationStack {
                List {
                    Section() {
                        ForEach(venueViewModel.venues, id: \.self) { venue in
                            ZStack(alignment: .bottom) {
                                AsyncImage(url: URL(string: venue.url)) { image in
                                    image.resizable()
                                } placeholder: {
                                    Color.blGrey
                                }
                                .aspectRatio(contentMode: .fill)
                                .frame(maxWidth: .infinity)
                                .clipped()
                                VStack(alignment: .leading, spacing: 5) {
                                    Text(venue.name)
                                        .font(.headline)
                                        .fontWeight(.bold)
                                    Text(venue.shortDescription)
                                        .font(.subheadline)
                                    HStack {
                                        Text(venue.type)
                                            .font(.caption)
                                            .foregroundColor(.accentColor)
                                            .padding(5)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 5)
                                                    .stroke(Color.accentColor, lineWidth: 1)
                                            )
                                        Text(venue.location)
                                            .font(.caption)
                                            .foregroundColor(.gray)
                                    }
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding()
                                .background(Color.blGrey)
                            } // end of ZStack
                            .listRowBackground(Color.clear)
                            .cornerRadius(10)
                            .padding([.horizontal, .top])
                            .listRowInsets(EdgeInsets())
                            .overlay(
                                NavigationLink(destination: DetailView(venue: venue)) {
                                    EmptyView()
                                }
                                .buttonStyle(PlainButtonStyle())
                                .frame(width: 0)
                                .opacity(0)
                            )
                        }
                        .listRowSeparator(.hidden)
                    }
                } // end of list
                .scrollContentBackground(.hidden)
                .background(Color.white)
                .listStyle(PlainListStyle())
                
            } // end of navigation stack
        } // end of vstack
    } // end of var body some view
} // end of content view

struct DetailView: View {
    var venue: Venue
    var body: some View {
        ZStack {
            Color.blPeach.ignoresSafeArea()
            HStack {
                
                Text(venue.name)
                    .font(.largeTitle)
                    .bold()
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(venueViewModel: VenueViewModel())
    }
}

















