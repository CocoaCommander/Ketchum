//
//  UserStorage.swift
//  Ketchum
//
//  Created by stlp on 6/3/21.
//

import Foundation

struct favoriteCard: Identifiable {
    var id = UUID()
    var cardID: String
    var name: String
}

struct deckCard: Identifiable {
    var id = UUID()
    var cardID: String
    var name: String
    var superType: String
}

class UserStorage: ObservableObject {
    @Published var favorites = [favoriteCard(cardID: "testID", name: "name")]
    @Published var deckCards = [deckCard(cardID: "testID", name: "name", superType: "Pokemon"), deckCard(cardID: "testID", name: "name", superType: "Energy"), deckCard(cardID: "testID", name: "name", superType: "Trainer")]
}
