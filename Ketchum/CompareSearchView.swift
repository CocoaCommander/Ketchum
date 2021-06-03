//
//  CompareSearchView.swift
//  Ketchum
//
//  Created by Justin Lim on 5/26/21.
//

import SwiftUI

struct CompareSearchView: View {
    @State private var searchQuery = ""
    var body: some View {
        NavigationView {
            VStack {
                Text("Ketchum")
                TextField("Search", text: $searchQuery)
                HStack {
                    Text("Selection 1")
                    Text("Selection 2")
                    Button("Compare") {
                        
                    }
                }
//                ScrollView {
//                    ForEach() {
//                        ForEach() {
//                            
//                        }
//                    }
//                }
            }
        }
    }
}

struct CompareSearchView_Previews: PreviewProvider {
    static var previews: some View {
        CompareSearchView()
    }
}
