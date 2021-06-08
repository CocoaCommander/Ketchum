//
//  FavoritesView.swift
//  Ketchum
//
//  Created by stlp on 6/7/21.
//

import SwiftUI

struct FavoritesView: View {
    @EnvironmentObject var userStore: UserStorage

    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Image("pokeball")
                        .resizable()
                        .renderingMode(.original)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: CGFloat(50), height: CGFloat(50))
                    Text("My Favorited Pokemon").font(.custom("Bold", size: 30))
                        .fontWeight(.medium)
                }
                ForEach((self.userStore.favorites), id: \.id) { favorite in
                    CardView(cardData: favorite).environmentObject(userStore)
                }
            }
        }
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView().environmentObject(UserStorage())
    }
}
