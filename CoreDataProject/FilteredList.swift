//
//  FilteredList.swift
//  CoreDataProject
//
//  Created by saj panchal on 2021-07-28.
//

import SwiftUI

struct FilteredList: View {
    var fetchRequest: FetchRequest<Singer>
    init(filter: String, predicate: String) {
        fetchRequest = FetchRequest<Singer>(entity: Singer.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Singer.firstName, ascending: false)], predicate: NSPredicate(format: "\(predicate)", filter))
    }
    var body: some View {
        List(fetchRequest.wrappedValue, id: \.self) { singer in
            Text("\(singer.wrappedFirstName)")
        }
    }
}

struct FilteredList_Previews: PreviewProvider {
    static var previews: some View {
        FilteredList(filter: "", predicate: "lastName BEGINSWITH %@")
    }
}
