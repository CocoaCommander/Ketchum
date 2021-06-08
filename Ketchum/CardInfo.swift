//
//  CardInfo.swift
//  Ketchum
//
//  Created by Vivian Nguyen on 5/28/21.
//

import Foundation
import SwiftUI

struct CardInfo: View {
    // Replace fillers with commented code after search is done
    
    @State var pokemon: Datum
    
    var body: some View {
        VStack {
            RemoteImage(url: (pokemon.images?.small)!)
                .padding(.top)
            Text(pokemon.name!)
                .font(.custom("Bold", size: 24))
                .padding()
            VStack {
                Divider()
                HStack{
                    VStack{
                    Text("HP")
                        .font(.custom("Bold", size: 18))
                        .foregroundColor(Color.red)
                    Text(pokemon.hp!)
                        .font(.custom("Italic", size: 14))
                    }
                    .padding()
                    Divider()
                        .frame(maxHeight: 70)
                    VStack{
                        Text("Super Type")
                            .font(.custom("Bold", size: 18))
                            .foregroundColor(Color.red)
                        Text(pokemon.supertype!)
                            .font(.custom("Italic", size: 14))
                    }
                    .padding()
                    
                }
               
                Divider()
                Group{
                    HStack{
                        VStack(alignment: .leading){
                   /* Text("Attacks")
                        .font(.custom("Bold", size: 18))
                        .foregroundColor(Color.red)
                        .padding(.top)
                    Text("Pollen Hazard ...")
                        .font(.custom("Regular", size: 14))
                    Text("Solar Beam ...")
                        .font(.custom("Regular", size: 14))
                    Text("Evergreen-GX ...")
                        .font(.custom("Regular", size: 14))*/
                    
                    ForEach(pokemon.attacks!, id: \.name) { attack in
                     Text(attack.name!).font(.custom("Bold", size: 14))
                         
                        }
                        VStack(alignment: .trailing) {
                            /*Text("DMG")
                                .font(.custom("Bold", size: 18))
                                .foregroundColor(Color.red)
                                .padding(.top)
                            Text("50")
                                .font(.custom("Bold", size: 14))
                            Text("150")
                                .font(.custom("Bold", size: 14))
                            Text("180")
                                .font(.custom("Bold", size: 14))*/
                            
                            ForEach(pokemon.attacks!, id: \.name) { attack in
                             Text(attack.damage!).font(.custom("Bold", size: 14))
                                 
                        }
                        
                    }
                }
                Divider()
                    Text("Prices")
                        .font(.custom("Bold", size: 18))
                        .foregroundColor(Color.red)
                        .padding(.top)
                    HStack{
                        VStack{
                            /*Text("Market")
                                .font(.custom("Bold", size: 14))
                            Text("$15.85")
                                .font(.custom("Italic", size: 14))*/
                            if pokemon.tcgplayer?.prices?.holofoil?.market != nil {
                            Text(String((pokemon.tcgplayer?.prices?.holofoil?.market)!)).font(.custom("Italic", size: 14))
                        }
                            
                        
                        }
                        .padding(.leading)
                        
                        VStack{
                        Text("Low")
                            .font(.custom("Bold", size: 14))
                        Text("$15.58")
                            .font(.custom("Italic", size: 14))
                        /*if pokemon.tcgplayer?.prices?.holofoil?.market != nil {
                            Text(String((pokemon.tcgplayer?.prices?.holofoil?.low)!)).font(.custom("Italic", size: 14))
                        }*/
                        }
                        .padding()
                        
                        VStack{
                            /*Text("Mid")
                            .font(.custom("Bold", size: 14))
                        Text("$24.99")
                            .font(.custom("Italic", size: 14))*/
                       if pokemon.tcgplayer?.prices?.holofoil?.mid != nil {
                            Text(String((pokemon.tcgplayer?.prices?.holofoil?.mid)!)).font(.custom("Italic", size: 14))
                        }
                        }
                        
                        VStack{
                            /*Text("High")
                            .font(.custom("Bold", size: 14))
                        Text("$42.95")
                            .font(.custom("Italic", size: 14))*/
                        if pokemon.tcgplayer?.prices?.holofoil?.high != nil {
                            Text(String((pokemon.tcgplayer?.prices?.holofoil?.high)!)).font(.custom("Italic", size: 14))
                        }
                            
                        }
                        .padding()
                    }
            }
        }
    }
}
}
}



