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
        VStack {
            AppNameView()
            NavigationStack {
                List {
                    
                    Section("Featured") {
                        ForEach(venueViewModel.venues.filter { $0.newEntry == true }, id: \.self) { venue in
                            ZStack {
                                VStack {
                                    AsyncImage(url: URL(string: venue.url)) { image in
                                        image.resizable()
                                    } placeholder: {
                                        Color.gray.opacity(0.3)
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
                                            Text(venue.location)
                                                .font(.caption)
                                        }
                                    }
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding()
                                }
                                .background(Color.blGrey) // Background color for the VStack content
                                .overlay(
                                            RoundedRectangle(cornerRadius: 10)
//                                                .stroke(Color.blPink, lineWidth: 10)
                                                .stroke(
                                                            LinearGradient(gradient: Gradient(colors: [.red, .orange, .yellow, .green, .blue, .indigo, .purple]), startPoint: .leading, endPoint: .trailing),
                                                            lineWidth: 6
                                                        )
                                        )
                                .cornerRadius(10) // Apply corner radius to VStack content
                            }
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






                    
                    
                    Section("Restaurants") {
                        ForEach(venueViewModel.venues.filter { $0.type == "restaurant" }, id: \.self) { venue in
                            NavigationLink(value: venue) {
                                HStack {
                                    VStack(alignment: .leading, spacing: 5) {
                                        Text(venue.name)
                                            .font(.headline)
                                            .fontWeight(.bold)
                                        Text(venue.shortDescription)
                                            .font(.subheadline)
                                            .foregroundColor(.secondary)
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
                                }
                                .padding(.vertical, 8)
                            }
                            .foregroundColor(.black) // Set text color
                            .padding() // Add some padding around the text
                            .background(Color.blPink) // Set the background color
                            .cornerRadius(10) // Round the corners
                            .listRowSeparator(.hidden)
                            
                            
                        }
                    }
                    // Repeat for other sections if necessary...
                    
                    Section("Pubs") {
                        ForEach(venueViewModel.venues.filter { $0.type == "pub" }, id: \.self) { venue in
                            NavigationLink(value: venue) {
                                HStack {
                                    VStack(alignment: .leading, spacing: 5) {
                                        Text(venue.name)
                                            .font(.headline)
                                            .fontWeight(.bold)
                                        Text(venue.shortDescription)
                                            .font(.subheadline)
                                            .foregroundColor(.secondary)
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
                                }
                                .padding(.vertical, 8)
                            }
                            
                        }
                    }
                    
                    Section("Coffee Shops") {
                        ForEach(venueViewModel.venues.filter { $0.type == "coffee shop" }, id: \.self) { venue in
                            NavigationLink(value: venue) {
                                HStack {
                                    VStack(alignment: .leading, spacing: 5) {
                                        Text(venue.name)
                                            .font(.headline)
                                            .fontWeight(.bold)
                                        Text(venue.shortDescription)
                                            .font(.subheadline)
                                            .foregroundColor(.secondary)
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
                                }
                                .padding(.vertical, 8)
                            }
                            
                        }
                    }
                    
                    Section("Shops") {
                        ForEach(venueViewModel.venues.filter { $0.type == "shop" }, id: \.self) { venue in
                            NavigationLink(value: venue) {
                                HStack {
                                    VStack(alignment: .leading, spacing: 5) {
                                        Text(venue.name)
                                            .font(.headline)
                                            .fontWeight(.bold)
                                        Text(venue.shortDescription)
                                            .font(.subheadline)
                                            .foregroundColor(.secondary)
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
                                }
                                .padding(.vertical, 8)
                            }
                            
                        }
                    }
                }
                
                // Navigation Stack Styling
                
                .listStyle(PlainListStyle()) // Removes the default List styling
                //                .background(Color.white.edgesIgnoringSafeArea(.all)) // Sets the entire List background
                //                .scrollContentBackground(.hidden) // Hide the default List background
                //                .background(Color.pink) // Set your new background color
                
                .navigationDestination(for: Venue.self) { venue in
                    DetailView(venue: venue)
                }
            }
        }
        
    }
}

struct DetailView: View {
    var venue: Venue
    
    var body: some View {
        ZStack {
            Color.pink.ignoresSafeArea()
            
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

















