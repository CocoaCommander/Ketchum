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

