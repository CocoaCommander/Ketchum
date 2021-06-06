//
//  SearchResultsView.swift
//  Ketchum
//
//  Created by Ryan Lee on 6/6/21.
//

import SwiftUI

struct SearchResultsView: View {
    
    private let columnCount = 2
    
    var body: some View {
        VStack {
            HStack {
                Image("pokeball")
                    .resizable()
                    .renderingMode(.original)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: CGFloat(100), height: CGFloat(100))
                Text("Ketchum")
                    .font(.custom("Bold", size: 30))
                    .fontWeight(.medium)
            }
            ScrollView(.vertical) {
                ForEach(0..<30) { column in
                    HStack {
                        ForEach(0..<2) { row in
                            SearchResultCard()
                        }
                    }
                }
            }
        }
    }
}

struct SearchResultCard: View {
    var body: some View {
        VStack {
            Image("Venausaur")
            Text("Name Goes here")
            HStack {
                Button(
                    action: {
                        
                    }, label: {
                        Text("Add To Deck")
                    }
                )
                Button(
                    action: {
                        
                    }, label: {
                        Text("Favorite")
                    }
                )
            }
        }
    }
}

struct SearchResultsView_Previews: PreviewProvider {
    static var previews: some View {
        SearchResultsView()
    }
}
