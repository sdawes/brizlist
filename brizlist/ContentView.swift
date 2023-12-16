//
//  ContentView.swift
//  brizlist
//
//  Created by Stephen Dawes on 15/12/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.gray.opacity(0.2)
            VenueView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


