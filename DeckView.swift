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
                HStack {
                    Image("pokeball")
                        .resizable()
                        .renderingMode(.original)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: CGFloat(50), height: CGFloat(50))
                    Text("My Deck").font(.custom("Bold", size: 30))
                       
                    
                }
                Text(String(userStore.deck.count) + " / 60 cards").fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).font(.title2)
                
                Text("Pokémon").fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).font(.title3).padding()
                ForEach((self.userStore.deck), id: \.id) { card in
                    if (card.supertype == "Pokémon") {
                        CardView(cardData: card).environmentObject(userStore)
                    }
                }
                    Text("Energy").fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).font(.title3).padding()
                    
                    ForEach((self.userStore.deck), id: \.id) { card in
                        if (card.supertype == "Energy") {
                            CardView(cardData: card).environmentObject(userStore)
                        }
                    }
                    
                    Text("Trainer").fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).font(.title3).padding()
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
