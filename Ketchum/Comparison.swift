//
//  Comparison.swift
//  Ketchum
//
//  Created by Justin Lim on 6/3/21.
//

import SwiftUI

struct Comparison: View {
    @State var pokemon1 : Datum
    @State var pokemon2 : Datum
    var body: some View {
        VStack {
            HStack {
                Image("pokeball")
                    .resizable()
                    .renderingMode(.original)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: CGFloat(50), height: CGFloat(50))
                Text("Comparison")
                    .font(.custom("Bold", size: 30))
                    .fontWeight(.medium)
            }
            Divider()
            HStack {
                //First Pokemon
                VStack {
                    Text(pokemon1.name!).font(.custom("Bold", size: 20))
                    RemoteImage(url: (pokemon1.images?.small)!).aspectRatio(contentMode: .fit)
                    HStack {
                        Text("Attacks: ").font(.custom("Bold", size: 15))
                        VStack {
                            ForEach(pokemon1.attacks!, id: \.name) { attack in
                                Text(attack.name!).font(.custom("Regular", size: 15))
                            }
                        }
                    }
                    Divider()
                    HStack {
                        Text("SuperType: ").font(.custom("Bold", size: 15))
                        Text(pokemon1.supertype!).font(.custom("Regular", size: 15))
                    }
                    Divider()
                    HStack {
                        Text("HP: ").font(.custom("Bold", size: 15))
                        Text(pokemon1.hp!).font(.custom("Regular", size: 15))
                    }
                    Divider()
                    HStack {
                        Text("Prices: ").font(.custom("Bold", size: 15))
                        VStack {
                            if pokemon1.tcgplayer?.prices?.holofoil?.low != nil {
                                Text("Low: $" + String((pokemon1.tcgplayer?.prices?.holofoil?.low)!)).font(.custom("Regular", size: 15))
                            }
                            if pokemon1.tcgplayer?.prices?.holofoil?.mid != nil {
                                Text("Mid: $" + String((pokemon1.tcgplayer?.prices?.holofoil?.mid)!)).font(.custom("Regular", size: 15))

                            }
                            if pokemon1.tcgplayer?.prices?.holofoil?.high != nil {
                                Text("High: $" + String((pokemon1.tcgplayer?.prices?.holofoil?.high)!)).font(.custom("Regular", size: 15))

                            }
                            if pokemon1.tcgplayer?.prices?.holofoil?.market != nil {
                                Text("Market: $" + String((pokemon1.tcgplayer?.prices?.holofoil?.market)!)).font(.custom("Regular", size: 15))

                            }
                            if pokemon1.tcgplayer?.prices?.holofoil?.directLow != nil {
                                Text("Direct Low: $" + String((pokemon1.tcgplayer?.prices?.holofoil?.directLow)!)).font(.custom("Regular", size: 15))
                            }
                        }
                    }
                    Spacer()
                }.padding()
                Divider()
                //Second Pokemon
                VStack {
                    Text(pokemon2.name!).font(.custom("Bold", size: 20))
                    RemoteImage(url: (pokemon2.images?.small)!).aspectRatio(contentMode: .fit)
                    HStack {
                        Text("Attacks: ").font(.custom("Bold", size: 15))
                        VStack {
                            ForEach(pokemon2.attacks!, id: \.name) { attack in
                                Text(attack.name!).font(.custom("Regular", size: 15))
                            }
                        }
                    }
                    Divider()
                    HStack {
                        Text("SuperType: ").font(.custom("Bold", size: 15))
                        Text(pokemon2.supertype!).font(.custom("Regular", size: 15))
                    }
                    Divider()
                    HStack {
                        Text("HP: ").font(.custom("Bold", size: 15))
                        Text(pokemon2.hp!).font(.custom("Regular", size: 15))
                    }
                    Divider()
                    HStack {
                        Text("Prices: ").font(.custom("Bold", size: 15))
                        VStack {
                            if pokemon2.tcgplayer?.prices?.holofoil?.low != nil {
                                Text("Low: $" + String((pokemon2.tcgplayer?.prices?.holofoil?.low)!)).font(.custom("Regular", size: 15))
                            }
                            if pokemon2.tcgplayer?.prices?.holofoil?.mid != nil {
                                Text("Mid: $" + String((pokemon2.tcgplayer?.prices?.holofoil?.mid)!)).font(.custom("Regular", size: 15))
                            }
                            if pokemon2.tcgplayer?.prices?.holofoil?.high != nil {
                                Text("High: $" + String((pokemon2.tcgplayer?.prices?.holofoil?.high)!)).font(.custom("Regular", size: 15))
                            }
                            if pokemon2.tcgplayer?.prices?.holofoil?.market != nil {
                                Text("Market: $" + String((pokemon2.tcgplayer?.prices?.holofoil?.market)!)).font(.custom("Regular", size: 15))
                            }
                            if pokemon2.tcgplayer?.prices?.holofoil?.directLow != nil {
                                Text("Direct Low: $" + String((pokemon2.tcgplayer?.prices?.holofoil?.directLow)!)).font(.custom("Regular", size: 15))
                            }
                        }
                    }
                    Spacer()
                }.padding()

            }
        }
    }
}

