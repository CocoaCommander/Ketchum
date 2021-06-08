//
//  DeckView.swift
//  Ketchum
//
//  Created by stlp on 6/7/21.
//

import SwiftUI

struct DeckView: View {
    @EnvironmentObject var userStore: UserStorage

    var body: some View {
        ScrollView {
            VStack {
                Text("My Deck").font(.title)
                Text(String(userStore.deck.count) + " / 60 cards")
                
                Text("Pokémon").padding()
                ForEach((self.userStore.deck), id: \.id) { card in
                    if (card.supertype == "Pokémon") {
                        CardView(cardData: card).environmentObject(userStore)
                    }
                }
                
                Text("Energy").padding()
                ForEach((self.userStore.deck), id: \.id) { card in
                    if (card.supertype == "Energy") {
                        CardView(cardData: card).environmentObject(userStore)
                    }
                }
                
                Text("Trainer").padding()
                ForEach((self.userStore.deck), id: \.id) { card in
                    if (card.supertype == "Trainer") {
                        CardView(cardData: card).environmentObject(userStore)
                    }
                }
            }
        }
    }
}

struct DeckView_Previews: PreviewProvider {
    static var previews: some View {
        DeckView()
    }
}
