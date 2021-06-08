//
//  CompareSearchView.swift
//  Ketchum
//
//  Created by Justin Lim on 6/4/21.
//

import SwiftUI

import SwiftUI

//Empty Datum Object
private var emptyPokemon : Datum = Datum.init(id: "", name: "Select a Pokemon!", supertype: "", subtypes: [], hp: "", types: [], evolvesFrom: "", rules: [], attacks: [], weaknesses: [], retreatCost: [], convertedRetreatCost: 0, datumSet: Set.init(id: "", name: "", series: "", printedTotal: 0, total: 0, legalities: Legalities.init(unlimited: Expanded.init(rawValue: ""), standard: Expanded.init(rawValue: ""), expanded: Expanded.init(rawValue: "")), ptcgoCode: "", releaseDate: "", updatedAt: "", images: SetImages.init(symbol: "", logo: "")), number: "", artist: "", rarity: "", nationalPokedexNumbers: [], legalities: Legalities.init(unlimited: Expanded.init(rawValue: ""), standard: Expanded.init(rawValue: ""), expanded: Expanded.init(rawValue: "")), images: DatumImages.init(small: "", large: ""), tcgplayer: Tcgplayer.init(url: "", updatedAt: "", prices: Prices.init(holofoil: Holofoil.init(low: 0.0, mid: 0.0, high: 0.0, market: 0.0, directLow: 0.0))), resistances: [])

struct CompareSearchView: View {
    //Inital Datum Objects
    @State private var pokemon1 : Datum = emptyPokemon
    @State private var pokemon2 : Datum = emptyPokemon
    @State private var searchQuery = ""
    @State private var action : Int? = 0
    @State var loadError: String = ""
    @EnvironmentObject var userStore: UserStorage

    // cardData.data is an array of datum
    @State var cardData: CardDataModel? = nil
    
    @ViewBuilder
    var body: some View {
        NavigationView {
            VStack {
                //The header portion
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
                Spacer()
                
                SearchBar(searchTerm: searchQuery, loadError: $loadError, cardData: $cardData)
                
                Spacer()
                
                HStack {
                    Spacer()
                    Text(pokemon1.name!).onTapGesture {
                        if pokemon2.id != "" {
                            pokemon1 = pokemon2
                            pokemon2 = emptyPokemon
                        } else {
                            pokemon1 = emptyPokemon
                        }
                    }.padding(.leading, 10)
                    .padding(.trailing, 10)
                    .padding(.top, 5)
                    .padding(.bottom, 5)
                    .font(.custom("Regular", size: 12))
                    .background(Color.gray)
                    .foregroundColor(.white)
                    Spacer()
                    Text(pokemon2.name!).onTapGesture {
                        pokemon2 = emptyPokemon
                    }.padding(.leading, 10)
                    .padding(.trailing, 10)
                    .padding(.top, 5)
                    .padding(.bottom, 5)
                    .font(.custom("Regular", size: 12))
                    .background(Color.gray)
                    .foregroundColor(.white)
                    Spacer()
                    NavigationLink(destination: Comparison(pokemon1: pokemon1, pokemon2: pokemon2), tag: 1, selection: $action){
                        EmptyView()
                    }

                    
                    Text("Compare").onTapGesture {
                        self.action = 1
                    }.padding(.leading, 10)
                    .padding(.trailing, 10)
                    .padding(.top, 5)
                    .padding(.bottom, 5)
                    .font(.custom("Regular", size: 12))
                    .background(Color.red)
                    .foregroundColor(.white)
                    Spacer()
                }
                Spacer()
                //The list to display the searched pokemon cards
                if cardData != nil {
                    List {
                        ForEach((cardData?.data)!, id: \.id) { pokemon in
//                            NavigationLink(
//                                destination: CardView(cardData: pokemon).environmentObject(userStore),
//                                label: {
//                                    Text("View Card")
//                                })
                            Button(action: {
                                if pokemon1.id == "" && pokemon2.id == "" {
                                    pokemon1 = pokemon
                                } else if pokemon1.id != "" && pokemon2.id == "" {
                                    pokemon2 = pokemon
                                }
                                //Maybe add a alert later
                            }) {
//                                VStack {
//                                    RemoteImage(url: (pokemon.images?.small)!)
//                                    HStack {
//                                        Text(pokemon.name!).font(.custom("Regular", size: 15))
//                                    }
//                                }
                                CardView(cardData: pokemon).environmentObject(userStore)
                            }
                        }
                    }
                } else {
                    List{
                        Text("Try Searching a Pokemon!").font(.custom("Regular", size: 30))
                    }
                    
                }
                
                
            }
        }.accentColor( .red)
    }
}

//Struct to get the image from the URL
struct RemoteImage: View {
    private enum LoadState {
        case loading, success, failure
    }

    private class Loader: ObservableObject {
        var data = Data()
        var state = LoadState.loading

        init(url: String) {
            guard let parsedURL = URL(string: url) else {
                fatalError("Invalid URL: \(url)")
            }

            URLSession.shared.dataTask(with: parsedURL) { data, response, error in
                if let data = data, data.count > 0 {
                    self.data = data
                    self.state = .success
                } else {
                    self.state = .failure
                }

                DispatchQueue.main.async {
                    self.objectWillChange.send()
                }
            }.resume()
        }
    }

    @StateObject private var loader: Loader
    var loading: Image
    var failure: Image

    var body: some View {
        selectImage()
            .resizable()
    }

    init(url: String, loading: Image = Image(systemName: "photo"), failure: Image = Image(systemName: "multiply.circle")) {
        _loader = StateObject(wrappedValue: Loader(url: url))
        self.loading = loading
        self.failure = failure
    }

    private func selectImage() -> Image {
        switch loader.state {
        case .loading:
            return loading
        case .failure:
            return failure
        default:
            if let image = UIImage(data: loader.data) {
                return Image(uiImage: image)
            } else {
                return failure
            }
        }
    }
}




struct CompareSearchView_Previews: PreviewProvider {
    static var previews: some View {
        CompareSearchView()
    }
}
