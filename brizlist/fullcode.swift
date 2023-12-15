//
//  brizlistApp.swift
//  brizlist
//
//  Created by Stephen Dawes on 15/12/2023.
//

import SwiftUI
import Firebase

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}

@main
struct brizlistApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}


//
//  ContentView.swift
//  brizlist
//
//  Created by Stephen Dawes on 15/12/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VenueView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


//
//  Venue.swift
//  brizlist
//
//  Created by Stephen Dawes on 15/12/2023.
//

import Foundation

struct Venue: Identifiable {
    var id: String
    var name: String
    var type: String
    var url: String

    init(id: String, name: String, type: String, url: String) {
        self.id = id
        self.name = name
        self.type = type
        self.url = url
    }
}
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
                return Venue(id: document.documentID, name: name, type: type, url: url)
            }
        }
    }
}
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
            VStack(alignment: .leading) {
                Text(venue.name).font(.headline)
                Text(venue.type).font(.subheadline)
            }
        }.onAppear() {
            self.viewModel.fetchData()
        }
    }
}


struct VenueView_Previews: PreviewProvider {
    static var previews: some View {
        VenueView()
    }
}

