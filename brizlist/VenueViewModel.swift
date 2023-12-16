//
//  VenueViewModel.swift
//  brizlist
//
//  Created by Stephen Dawes on 15/12/2023.
//

import Foundation
import Firebase
import FirebaseFirestore

class VenueViewModel: ObservableObject {
    @Published var venues = [Venue]()

    private var db = Firestore.firestore()

    func fetchData() {
        db.collection("venues").addSnapshotListener { querySnapshot, error in
            guard let documents = querySnapshot?.documents else {
                print("No documents: \(error?.localizedDescription ?? "Unknown error")")
                return
            }

            self.venues = documents.map { document in
                let data = document.data()
                let name = data["name"] as? String ?? ""
                let type = data["type"] as? String ?? ""
                let url = data["url"] as? String ?? ""
                let location = data["location"] as? String ?? ""
                let shortDescription = data["shortDescription"] as? String ?? ""
                return Venue(id: document.documentID, name: name, type: type, url: url, location: location, shortDescription: shortDescription)
            }
        }
    }
}
