//
//  CompareSearchView.swift
//  Ketchum
//
//  Created by Justin Lim on 5/26/21.
//

import SwiftUI

struct CompareSearchView: View {
    @State private var searchQuery = ""
    @State private var pokemon1 : Datum
    @State private var pokemon2 : Datum
    @State private var action : Int? = 0
    var body: some View {
        NavigationView {
            VStack {
                Text("Ketchum").font(.custom("Bold", size: 20))
                TextField("Search", text: $searchQuery)
                HStack {
                    Text(pokemon1.name!).padding()
                    Text(pokemon2.name!).padding()
                    NavigationLink(destination: Comparison(pokemon1: pokemon1, pokemon2: pokemon2), tag: 1, selection: $action){
                        EmptyView()
                    }
                    Text("Compare").onTapGesture {
                        self.action = 1
                    }
                }
                //TODO: Show the searched pokemon and when clicked, add to the pokemon variable.
                ScrollView {
                    
                }
            }
        }
    }
}

