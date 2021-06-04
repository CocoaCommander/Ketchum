//
//  HomeView.swift
//  Ketchum
//
//  Created by Ryan Lee on 6/2/21.
//

import SwiftUI

struct HomeView: View {
    
    @State var searchTerm = ""
    
    var body: some View {
        VStack {
            Image("pokeball")
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fit)
                .frame(width: CGFloat(100), height: CGFloat(100))
            Text("Ketchum")
                .font(.custom("Bold", size: 30))
                .fontWeight(.medium)
            SearchBar(searchTerm: $searchTerm)
            Text("try searching pikachu!")
                .font(.custom("ExtraLight", size: 12))

        }
    }
}

struct SearchBar: View {
    
    @Binding var searchTerm: String
    let apiCaller = APICaller()
    
    var body: some View {
        HStack {
            TextField("Search", text: $searchTerm)
                .padding(.leading, 10)
                .font(.custom("Regular", size: 12))
                .disableAutocorrection(true)
            Button(
                action: {
                    apiCaller.loadData(searchTerm: "?q=name:\(searchTerm)*")
                    print(apiCaller.data ?? "load failed")
                }, label: {
                    Text("GO!")
                        .padding(.leading, 10)
                        .padding(.trailing, 10)
                        .padding(.top, 5)
                        .padding(.bottom, 5)
                        .font(.custom("Regular", size: 12))
                        .background(Color.red)
                        .foregroundColor(.white)
                }
            )
            
        }
        .overlay(
            RoundedRectangle(cornerRadius: 10.0)
                .stroke(Color.black, lineWidth: 1)
        )
        .padding()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
