//
//  CardInfo.swift
//  Ketchum
//
//  Created by Vivian Nguyen on 5/28/21.
//

import Foundation
import SwiftUI

struct CardInfo: View {
    var body: some View {
        ScrollView {
            VStack (alignment: .center) {
                Image("Venausaur")
                    .padding(.top)
                Text("Celebi & Venausaur")
                    .font(.custom("Bold", size: 24))
                    .padding()
                VStack (spacing: 5){
                    Divider()
                        Text("Rarity")
                            .font(.custom("Bold", size: 18))
                        Text("Rare Ultra")
                            .font(.custom("Italic", size: 12))
                    Divider()
                        Text("Attacks")
                            .font(.custom("Bold", size: 18))
                        Text("Pollen Hazard")
                            .font(.custom("Bold", size: 14))
                        Text("Your opponent's Active Pokemon is now Burned, Confused, and Poisoned.")
                            .font(.custom("Italic", size: 12))
                        Text("Solar Beam")
                            .font(.custom("Bold", size: 14))
                        Text("Evergreen-GX")
                            .font(.custom("Bold", size: 14))
                        Text("Blah blah blah blah")
                            .font(.custom("Italic", size: 12))
                    
                    }
                }
                .ignoresSafeArea(.all, edges: .all)
        }
    }
}
