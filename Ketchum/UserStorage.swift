//
//  UserStorage.swift
//  Ketchum
//
//  Created by stlp on 6/6/21.
//

import Foundation

class UserStorage: ObservableObject {
    @Published var favorites = [Datum]()
    
    @Published var deck = [Datum]()
    
    // function to add to favorites
    func addToFavorites(newcard: Datum) -> String {
        favorites.append(newcard)
        let numElements = self.favorites.count
        guard let currName = newcard.name else { return " "}
        print(String(self.favorites.count))
        return("added to favorites, current count = " + String(numElements) + " name " + String(currName))
    }
    
    func isInCollection(checkedCard: Datum, collectionToCheck: [Datum]) -> Bool {
        for card in collectionToCheck {
            if (checkedCard.id == card.id) {
                return true
            }
        }
        return false
    }
    
    func removeFavorite(removedCard: Datum, arrayToUpdate: [Datum]) {
        self.favorites = arrayToUpdate.filter { $0.id != removedCard.id }
        print(String(self.favorites.count))
    }
    
    func removeFromDeck(removedCard: Datum, arrayToUpdate: [Datum]) {
        self.deck = arrayToUpdate.filter { $0.id != removedCard.id }
        print(String(self.deck.count))
    }
    
    // function to add to deck
    func addToDeck(newcard: Datum) -> String {
        if (deck.count < 60) {
            deck.append(newcard)
            return("added to deck")
        }
        print(String(self.deck.count))
        return("deck already has 60 cards")
    }
}
