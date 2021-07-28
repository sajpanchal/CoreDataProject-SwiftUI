//
//  ContentView.swift
//  CoreDataProject
//
//  Created by saj panchal on 2021-07-27.
//

import SwiftUI


struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Ship.entity(), sortDescriptors: [], predicate: NSPredicate(format: "universe IN %@", ["Aliens","Firefly", "Star Trek"])) var ships: FetchedResults<Ship>
    @State private var lastNameFilter = "A"
    var body: some View {
        VStack {
            FilteredList(filter: lastNameFilter)
            Button("Add Examples") {
                let taylor = Singer(context: self.moc)
                taylor.firstName = "Taylor"
                taylor.lastName = "Swift"
                
                let ed = Singer(context: self.moc)
                ed.firstName = "Ed"
                ed.lastName = "Sheeran"
                
                let adele = Singer(context: self.moc)
                adele.firstName = "Adele"
                adele.lastName = "Adkins"
                                
                try? self.moc.save()
            }
            Button("Show A") {
                self.lastNameFilter = "A"
            }
            Button("Show S") {
                self.lastNameFilter = "S"
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
