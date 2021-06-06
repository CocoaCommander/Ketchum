//
//  DeckView.swift
//  Ketchum
//
//  Created by stlp on 6/3/21.
//

import SwiftUI

struct DeckView: View {
    @EnvironmentObject var userStorage: UserStorage
    
    var body: some View {
//        VStack {
//            HStack {
//                Text("0/60")
//                Text("Deck")
//            }
//            List {
//                ForEach(self.userStorage.favorites) { favorite in
//                    let name = favorite.name
//                    Text(name)
//                }
//            }
//        }
        
        VStack {
            HStack {
                let num = userStorage.deckCards.count
                Text(String(num) + " / 60").padding()
                Spacer()
                Text("Deck").padding()
            }
            Text("Pokemon")
            ForEach(self.userStorage.deckCards) { deckCard in
                let type = deckCard.superType
                if (type == "Pokemon") {
                    Text(type)
                }
            }
            
            Text("Trainer")
            ForEach(self.userStorage.deckCards) { deckCard in
                let type = deckCard.superType
                if (type == "Trainer") {
                    Text(type)
                }
            }
            
            Text("Energy")
            ForEach(self.userStorage.deckCards) { deckCard in
                let type = deckCard.superType
                if (type == "Energy") {
                    Text(type)
                }
            }

        }
    }
}

struct DeckView_Previews: PreviewProvider {
    static var previews: some View {
        DeckView().environmentObject(UserStorage())
    }
}
