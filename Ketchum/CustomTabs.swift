//
//  CustomTabs.swift
//  Ketchum
//
//  Created by Vivian Nguyen on 6/2/21.
//

import Foundation
import SwiftUI

struct Tabs : View {
    @Binding var index : Int
    
    var body : some View {
        
        HStack{
            Button(action:{
                    self.index = 0
                
            } , label: {
                Text("About")
                    .font(.custom("Bold", size: 16))
            })
            .foregroundColor(Color.red.opacity(self.index == 0 ? 1 : 0.2))
            
            Spacer(minLength: 0)
            
            Button(action: {
                self.index = 1
            }, label: {
                Text("Favorite")
                    .font(.custom("Bold", size: 16))
            })
            .foregroundColor(Color.red.opacity(self.index == 1 ? 1 : 0.2))
            .offset(x: 10)
            
            Spacer(minLength: 0)
            
            Button(action: {
                self.index = 2
            }) {
                Image("pokeball")
                    .resizable()
                    .renderingMode(.original)
                    .frame(width: 70, height: 70)
            }
            .offset(y: -25)
    
            Spacer(minLength: 0)
            
            Button(action: {
                self.index = 3
            }, label: {
                Text("Compare")
                    .font(.custom("Bold", size: 16))
            })
            .foregroundColor(Color.red.opacity(self.index == 3 ? 1 : 0.2))
            .offset(x: -10)
            
            Spacer(minLength: 0)
            
            Button(action: {
                self.index = 4
            }, label: {
                Text("My Deck")
                    .font(.custom("Bold", size: 16))
            })
            .foregroundColor(Color.red.opacity(self.index == 4 ? 1 : 0.2))
        }
        .padding(.horizontal, 35)
        .background(Color.white)
    }
}
