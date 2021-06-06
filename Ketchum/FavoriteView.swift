//
//  SwiftUIView.swift
//  Ketchum
//
//  Created by stlp on 6/3/21.
//

import SwiftUI
// create an observable object
struct SwiftUIView: View {
    @EnvironmentObject var userStorage: UserStorage
    
    var body: some View {
        VStack {
            Text("Favorites").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            List {
                ForEach(self.userStorage.favorites) { favorite in
                    let name = favorite.name
                    Text(name)
                }
            }
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView().environmentObject(UserStorage())
    }
}
