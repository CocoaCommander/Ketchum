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
        VStack{
            ZStack {
                //About page
                if self.index == 0 {
                    About()
                }
                //Favorites list
                else if self.index == 1 {
                    Color.red.edgesIgnoringSafeArea(.top)
                    Text("Favorites")
                        .font(.custom("Bold", size: 30))
                        .foregroundColor(Color.white)
                }
                //Search cards
                else if self.index == 2 {
                    CardInfo()
                }
                //Comparing
                else if self.index == 3 {
                    CompareSearchView()
                } else{
                    //Custom deck build
                    Color.red.edgesIgnoringSafeArea(.top)
                    Text("My Deck")
                        .font(.custom("Bold", size: 30))
                        .foregroundColor(Color.white)
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

