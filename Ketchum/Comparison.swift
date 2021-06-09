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
        ScrollView(.vertical) {
            VStack {
                HStack {
                    Image("pokeball")
                        .resizable()
                        .renderingMode(.original)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: CGFloat(50), height: CGFloat(50))
                    Text("Comparison")
                        .font(.custom("Bold", size: 30))
                }
                Divider()
                HStack {
                    //First Pokemon
                    CompareComponent(pokemon1: $pokemon1)
                    Divider()
                    //Second Pokemon
                    CompareComponent(pokemon1: $pokemon2)
                }
            }
        }
    }
}


struct CompareComponent: View {
    
    @Binding var pokemon1 : Datum
    
    @ViewBuilder
    var body: some View {
        VStack {
            Text(pokemon1.name!)
                .font(.custom("Bold", size: 20))
                .lineLimit(1)
                .allowsTightening(true)
            RemoteImage(url: (pokemon1.images?.small)!).aspectRatio(contentMode: .fit)
            HStack(alignment: .firstTextBaseline) {
                Text("Attacks: ")
                    .font(.custom("Bold", size: 15))
                    .lineLimit(1)
                    .allowsTightening(true)
                if pokemon1.supertype == "Pokémon" {
                    VStack {
                        ForEach(pokemon1.attacks!, id: \.name) { attack in
                            Text(attack.name!)
                                .font(.custom("Regular", size: 15))
                                .lineLimit(1)
                                .allowsTightening(true)
                        }
                    }
                } else {
                    Text("No attacks")
                        .font(.custom("Regular", size: 15))
                        .lineLimit(1)
                        .allowsTightening(true)
                }
                
            }
            Divider()
            HStack(alignment: .firstTextBaseline) {
                Text("SuperType: ")
                    .font(.custom("Bold", size: 15))
                    .lineLimit(1)
                    .allowsTightening(true)
                Text(pokemon1.supertype!)
                    .font(.custom("Regular", size: 15))
                    .lineLimit(1)
                    .allowsTightening(true)
            }
            Divider()
            HStack(alignment: .firstTextBaseline) {
                Text("HP: ")
                    .font(.custom("Bold", size: 15))
                    .lineLimit(1)
                    .allowsTightening(true)
                if pokemon1.supertype == "Pokémon" {
                    Text(pokemon1.hp!)
                        .font(.custom("Regular", size: 15))
                        .lineLimit(1)
                        .allowsTightening(true)
                } else {
                    Text("No HP")
                        .font(.custom("Regular", size: 15))
                        .lineLimit(1)
                        .allowsTightening(true)
                }
                
            }
            Divider()
            HStack(alignment: .firstTextBaseline) {
                Text("Prices: ").font(.custom("Bold", size: 15))
                VStack {
                    if pokemon1.tcgplayer?.prices?.holofoil?.low != nil {
                        Text("Low: $" + String((pokemon1.tcgplayer?.prices?.holofoil?.low)!))
                            .font(.custom("Regular", size: 15))
                            .lineLimit(1)
                            .allowsTightening(true)
                    }
                    if pokemon1.tcgplayer?.prices?.holofoil?.mid != nil {
                        Text("Mid: $" + String((pokemon1.tcgplayer?.prices?.holofoil?.mid)!))
                            .font(.custom("Regular", size: 15))
                            .lineLimit(1)
                            .allowsTightening(true)
                        
                    }
                    if pokemon1.tcgplayer?.prices?.holofoil?.high != nil {
                        Text("High: $" + String((pokemon1.tcgplayer?.prices?.holofoil?.high)!))
                            .font(.custom("Regular", size: 15))
                            .lineLimit(1)
                            .allowsTightening(true)
                        
                    }
                    if pokemon1.tcgplayer?.prices?.holofoil?.market != nil {
                        Text("Market: $" + String((pokemon1.tcgplayer?.prices?.holofoil?.market)!))
                            .font(.custom("Regular", size: 15))
                            .lineLimit(1)
                            .allowsTightening(true)
                        
                    }
                    if pokemon1.tcgplayer?.prices?.holofoil?.directLow != nil {
                        Text("Direct Low: $" + String((pokemon1.tcgplayer?.prices?.holofoil?.directLow)!))
                            .font(.custom("Regular", size: 15))
                            .lineLimit(1)
                            .allowsTightening(true)
                    }
                }
            }
            Spacer()
        }.padding()
    }
}
