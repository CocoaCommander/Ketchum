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
                Text("My Favorited Pokemon").font(.title)
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
