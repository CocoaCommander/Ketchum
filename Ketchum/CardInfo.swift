//
//  CardInfo.swift
//  Ketchum
//
//  Created by Vivian Nguyen on 5/28/21.
//

import Foundation
import SwiftUI



struct CardInfo: View {
    @EnvironmentObject var userStorage: UserStorage
    // state variable for isfavorited
    @State var isFavorited = false
    //state variable for isInDeck
    @State var isInDeck = false
    
    // init should check to see if it is in the obserable object
    // if it is, initialize to true
    // if not, ititialize to false
    
    func addToFavorites() {
        // this would get state variables from card info view
        var favoriteCards = userStorage.favorites
        let newCard = favoriteCard(cardID: "test", name: "test")
        favoriteCards.append(newCard)
        userStorage.favorites = favoriteCards
        print(String(userStorage.favorites.count))
    }
    
    func addToDeck() {
        var deckCards = userStorage.deckCards
        if (deckCards.count <= 60) {
            // this would get state variables from card info view
            self.isInDeck = !isInDeck
            let newCard = deckCard(cardID: "test", name: "test", superType: "Pokemon")
            deckCards.append(newCard)
            userStorage.deckCards = deckCards
            print(String(userStorage.favorites.count))
        }
    }
    var body: some View {
        VStack {
            VStack {
                HStack {
                    Text("pikachu")
                        .font(.title)
                    // add a button that is for favorites
                    // add a button that is added to deck
                    
                }
                Button(action: {
                    if (isFavorited) {
                        addToFavorites()
                    } else {
                        // remove from favorites
                    }
                    self.isFavorited = !isFavorited
                }) {
                    Text("Favorite")
                }
                
                Button(action: {
                    if (isFavorited) {
                        addToFavorites()
                    } else {
                        // remove from favorites
                    }
                }) {
                    Text("Favorite")
                }
            }
        }
    }
    
}

struct CardInfo_Previews: PreviewProvider {
    static var previews: some View {
        CardInfo().environmentObject(UserStorage())
    }
}
