//
//  ContentView.swift
//  Ketchum
//
//  Created by Ryan Lee on 5/26/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var index = 0
    @EnvironmentObject var userStore: UserStorage

    var body: some View {
        VStack{
            ZStack {
                //About page
                if self.index == 0 {
                    About()
                }
                //Favorites list
                else if self.index == 1 {
//                    Color.red.edgesIgnoringSafeArea(.top)
//                    Text("Favorites")
//                        .font(.custom("Bold", size: 30))
//                        .foregroundColor(Color.white)
                    FavoritesView().environmentObject(userStore)
                }
                //Search cards & search results
                else if self.index == 2 {
                    // pass home view an environment object
                    HomeView().environmentObject(userStore)
                }
                //Comparing cards
                else if self.index == 3 {
                    CompareSearchView().environmentObject(userStore)
                } else{
                    //Custom deck build
//                    Color.red.edgesIgnoringSafeArea(.top)
//                    Text("My Deck")
//                        .font(.custom("Bold", size: 30))
//                        .foregroundColor(Color.white)
                    DeckView().environmentObject(userStore)
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
        ContentView().environmentObject(UserStorage())
    }
}

