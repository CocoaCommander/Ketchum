//
//  CardView.swift
//  Ketchum
//
//  Created by stlp on 6/6/21.
//

import SwiftUI

private var emptyPokemon : Datum = Datum.init(id: "", name: "Select a Pokemon!", supertype: "", subtypes: [], hp: "", types: [], evolvesFrom: "", rules: [], attacks: [], weaknesses: [], retreatCost: [], convertedRetreatCost: 0, datumSet: Set.init(id: "", name: "", series: "", printedTotal: 0, total: 0, legalities: Legalities.init(unlimited: Expanded.init(rawValue: ""), standard: Expanded.init(rawValue: ""), expanded: Expanded.init(rawValue: "")), ptcgoCode: "", releaseDate: "", updatedAt: "", images: SetImages.init(symbol: "", logo: "")), number: "", artist: "", rarity: "", nationalPokedexNumbers: [], legalities: Legalities.init(unlimited: Expanded.init(rawValue: ""), standard: Expanded.init(rawValue: ""), expanded: Expanded.init(rawValue: "")), images: DatumImages.init(small: "", large: ""), tcgplayer: Tcgplayer.init(url: "", updatedAt: "", prices: Prices.init(holofoil: Holofoil.init(low: 0.0, mid: 0.0, high: 0.0, market: 0.0, directLow: 0.0))), resistances: [])

struct CardView: View {
    var cardData: Datum
    @EnvironmentObject var userStore: UserStorage
    @State var showMessage = false
    @State var message: String = " "
    @State var isFavorited = false
    @State var showCardInfo = false
    //    @EnvironmentObject var dataStore: DataStore
    
    // add init to check OO if the card exists in deck or favorites to set state
    init(cardData: Datum) {
        self.cardData = cardData
    }
    
    var body: some View {
        NavigationView {
        VStack {
            NavigationLink(
                destination: /*@START_MENU_TOKEN@*/Text("Destination")/*@END_MENU_TOKEN@*/,
                label: {
                    Text(cardData.name!).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).font(.title2)
                })
            
                if (cardData.id != "") {
                    RemoteImage(url: (cardData.images?.small)!).padding()


                }
            
                HStack {
                    // favorites button
                    if (self.userStore.isInCollection(checkedCard: cardData, collectionToCheck: self.userStore.favorites)) {
                        Button(action: {
                            // if card data is not empty
                            self.showMessage = true
                            if (self.cardData.artist != "") {
                                self.userStore.removeFavorite(removedCard: cardData, arrayToUpdate: self.userStore.favorites)
                                self.message = "Card Unfavorited"
                            }
                        }) {
                            Text("Remove From Favorites").padding().font(.custom("Regular", size: 15)).foregroundColor(.white).background(Rectangle().foregroundColor(.red).cornerRadius(20)).padding()
                        }.padding()
                    } else {
                        Button(action: {
                            var str = String()
                            self.showMessage = true
                            if (self.cardData.artist != "") {
                                str = self.userStore.addToFavorites(newcard: self.cardData)
                                self.message = "Added to favorites"
                            }
                            print(str)
                        }) {
                            Text("Add to favorites").padding().font(.custom("Regular", size: 15)).foregroundColor(.white).background(Rectangle().foregroundColor(.red).cornerRadius(20)).padding(.bottom).padding(.leading)
                        }.padding()
                    }
                    Spacer()
                    
                    // if is not in deck
                    if (!self.userStore.isInCollection(checkedCard: cardData, collectionToCheck: self.userStore.deck)) {
                        Button(action: {
                            self.showMessage = true
                            if (self.cardData.artist != "") {
                                let str = self.userStore.addToDeck(newcard: self.cardData)
                                self.message = str
                            }
                        }) {
                            Text("Add to deck").padding().font(.custom("Regular", size: 15)).foregroundColor(.white).background(Rectangle().foregroundColor(.red).cornerRadius(20)).padding(.bottom).padding(.trailing)
                        }.padding()
                        
                    } else {
                        Button(action: {
                            self.showMessage = true
                            if (self.cardData.artist != "") {
                                //let str = self.userStore.addToDeck(newcard: self.cardData)
                                self.userStore.removeFromDeck(removedCard: cardData, arrayToUpdate: self.userStore.deck)
                                self.message = "Removed From Deck"
                            }
                        }) {
                            Text("Remove From Deck").padding().font(.custom("Regular", size: 15)).foregroundColor(.white).background(Rectangle().foregroundColor(.red).cornerRadius(20)).padding()
                        }.padding()
                        
                    }
                    
                }
                .alert(isPresented: $showMessage) {
                    Alert(title: Text(""), message: Text(self.message), dismissButton: .default(Text("Ok")))
                }
            
            .background(Rectangle().foregroundColor(.gray).cornerRadius(10).opacity(0.2).padding())
        }
        }
        
    }
}




struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(cardData: emptyPokemon).environmentObject(UserStorage())
    }
}
