//
//  About.swift
//  Ketchum
//
//  Created by Vivian Nguyen on 6/2/21.
//

import Foundation
import SwiftUI

struct About: View {
    
    var body: some View {
        VStack {
            HStack {
                Image("pokeball")
                    .resizable()
                    .renderingMode(.original)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: CGFloat(50), height: CGFloat(50))
                Text("Ketchum")
                    .font(.custom("Bold", size: 30))
                    .fontWeight(.medium)
            }
                ZStack {
                    Image("border")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        
                    Text("Welcome to the world of trading cards. You can compare cards, build your own deck and find all the information you need to know on hundreds of Pokemon. Now lets \"Catch 'Em All\"!")
                        .font(.custom("Regular", size: 14))
                        .multilineTextAlignment(.center)
                        .lineLimit(4)
                        .lineSpacing(10)
                        .frame(width: 300)
                }
        }
    }
}


