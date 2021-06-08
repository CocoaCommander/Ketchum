//
//  SearchResultsView.swift
//  Ketchum
//
//  Created by Ryan Lee on 6/6/21.
//

import SwiftUI

struct SearchResultsView: View {
    
    @Binding var cardData: CardDataModel?
    @EnvironmentObject var userStore: UserStorage

    var body: some View {
        VStack {
            ScrollView(.vertical) {
                
//                This code fails on odd numbered results
//                let columnCount: Int = 2
//                let dataLength: Double = Double((self.cardData?.data?.count)!)
//                let rowCount: Int = Int((dataLength / Double(columnCount)).rounded(.up))
//                ForEach(0..<rowCount) { row in
//                    HStack {
//                        ForEach(0..<columnCount) { column in
//                            SearchResultCard(name: (cardData?.data![row * 2 + column].name)!, imageURL: (cardData?.data![row * 2 + column].images?.small)!)
//                        }
//                    }
//                }
                ForEach(((self.cardData?.data)!), id: \.id) { card in
                    CardView(cardData: card).environmentObject(userStore)
                }
//                ForEach(0..<(cardData?.data!.count)!) { index in
//                    //add environment variable
//                    // use cardView here
//                    CardView(cardData: cardData.data[index])
////                    SearchResultCard(name: (cardData?.data![index].name)!, imageURL: (cardData?.data![index].images?.large)!)
//                }
//                ForEach(0..<(cardData?.data!.count)!) { index in
//                    SearchResultCard(name: (cardData?.data![index].name)!, imageURL: (cardData?.data![index].images?.large)!)
//                }
            }
        }
    }
}

struct SearchResultCard: View {
    
    var name: String
    var imageURL: String
    
    var body: some View {
        VStack {
            ImageViewURL(withURL: imageURL)
            Text(name)
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
