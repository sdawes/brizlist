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
    
    init() {
        fetchData()
    }
    
    private func fetchData() {
        db.collection("venues").addSnapshotListener { [weak self] querySnapshot, error in
            guard let documents = querySnapshot?.documents else {
                print("Error fetching documents: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            self?.venues = documents.map { document in
                let data = document.data()
                return Venue(
                    id: document.documentID,
                    name: data["name"] as? String ?? "",
                    type: data["type"] as? String ?? "",
                    url: data["url"] as? String ?? "",
                    location: data["location"] as? String ?? "",
                    shortDescription: data["shortDescription"] as? String ?? "",
                    newEntry: data["newEntry"] as? Bool ?? false,
                    featuredVenue: data["featuredVenue"] as? Bool ?? false
                )
            }
        }
    }
    
}







