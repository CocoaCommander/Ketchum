//
//  ContentView.swift
//  Ketchum
//
//  Created by Ryan Lee on 5/26/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var index = 0
    
    var body: some View {
<<<<<<< HEAD
=======
<<<<<<< HEAD
        
>>>>>>> origin
        VStack{
            ZStack {
                if self.index == 0 {
                    Color.red.edgesIgnoringSafeArea(.top
                    )
                    Text("About")
                        .font(.custom("Bold", size: 30))
                        .foregroundColor(Color.white)
                }
                else if self.index == 1 {
                    CardInfo()
                }
                else if self.index == 2 {
                    Color.red.edgesIgnoringSafeArea(.top)
                    Text("Search")
                        .font(.custom("Bold", size: 30))
                        .foregroundColor(Color.white)
                }
                else if self.index == 3 {
                    Color.red.edgesIgnoringSafeArea(.top)
                    Text("Compare")
                        .font(.custom("Bold", size: 30))
                        .foregroundColor(Color.white)
                } else{
                    Color.red.edgesIgnoringSafeArea(.top)
                    Text("My Deck")
                        .font(.custom("Bold", size: 30))
                        .foregroundColor(Color.white)
<<<<<<< HEAD
=======
=======
        ZStack {
            VStack (spacing: 25) {
                Text("Welcome to")
                    .font(.custom("ExtraLight", size: 24))
                    .scaleEffect(animate ? 3 : 1)
                Image("pokeball")
                    .resizable()
                    .renderingMode(.original)
                    .aspectRatio(contentMode: animate ? .fill : .fit)
                    .frame(width: animate ? nil : CGFloat(100), height: animate ? nil : CGFloat(100))
                    
                    .scaleEffect(animate ? CGFloat(3) : CGFloat(1))
                    .frame(width: UIScreen.main.bounds.width)
            
                Text("Ketchum")
                    .font(.custom("Bold", size: 30))
                    .fontWeight(.medium)
                    .scaleEffect(animate ? CGFloat(3) : CGFloat(1))
>>>>>>> 653aebb6be29871bdfdbf32e7970593bddddb5a4
                    
>>>>>>> origin
                }
               Welcome()
            }
            .padding(.bottom, -35)
            Spacer()
            Tabs(index: self.$index)
            }
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

