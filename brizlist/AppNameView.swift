//
//  AppNameView.swift
//  brizlist
//
//  Created by Stephen Dawes on 18/12/2023.
//

import SwiftUI

struct AppNameView: View {
    var body: some View {
        HStack {
            Image(systemName: "star.circle.fill")
                .foregroundColor(.white)
                .imageScale(.large)
                // Reduce or remove the left padding on the image
                .padding(.leading, 25) // Adjust this value as needed

            Text("brizlist")
                .font(.custom("UbuntuMono-Bold", size: 22))
                // Apply padding only to the top, bottom, and trailing edges
                .padding([.top, .bottom, .trailing])
                .foregroundColor(.white)


        }
        .frame(maxWidth: .infinity, alignment: .leading) // Align text to the left
        .background(Color.blRed)
    }
}

// Preview
struct AppNameView_Previews: PreviewProvider {
    static var previews: some View {
        AppNameView()
    }
}



