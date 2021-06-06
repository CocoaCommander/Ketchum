//
//  HomeView.swift
//  Ketchum
//
//  Created by Ryan Lee on 6/2/21.
//

import SwiftUI

struct HomeView: View {
    
    @State var loadError: String = ""
    @State var cardDataSearch: CardDataModel? = nil
    
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
            SearchBar(loadError: $loadError, cardData: $cardDataSearch)
            Text("try searching pikachu!")
                .font(.custom("ExtraLight", size: 12))

        }
    }
}

struct SearchBar: View {
    
    @State var searchTerm: String = ""
    let API_KEY = "ff4617de-f79d-4bbe-a94f-bde94a28ccb1"
    var baseURL = "https://api.pokemontcg.io/v2/cards"
    @Binding var loadError: String
    @Binding var cardData: CardDataModel?

    
    func loadData(searchTerm: String) -> Void {
        guard let url = URL(string: (baseURL + searchTerm)) else {
            print("Invalid URL")
            return
        }
        let group = DispatchGroup()
        group.enter()
        //let semaphore = DispatchSemaphore(value: 0)
        
        print("\n \(url.absoluteString)")
        
        var request = URLRequest(url: url)
        request.addValue(API_KEY, forHTTPHeaderField: "X-Api-Key")
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                do {
                    let decodedResponse = try JSONDecoder().decode(CardDataModel.self, from: data)
                    DispatchQueue.main.async {
                        self.cardData = decodedResponse
                        group.leave()
                    }
                    //semaphore.signal()
                } catch DecodingError.keyNotFound(let key, let context) {
                    self.loadError = "could not find key \(key) in JSON: \(context.debugDescription)"
                } catch DecodingError.valueNotFound(let type, let context) {
                    self.loadError = "could not find type \(type) in JSON: \(context.debugDescription)"
                } catch DecodingError.typeMismatch(let type, let context) {
                    self.loadError = "type mismatch for type \(type) in JSON: \(context.debugDescription)"
                } catch DecodingError.dataCorrupted(let context) {
                    self.loadError = "data found to be corrupted in JSON: \(context.debugDescription)"
                } catch let error as NSError {
                    self.loadError = "Error in read(from:ofType:) domain= \(error.domain), description= \(error.localizedDescription)"
                }
            }
            
        }.resume()
        //_ = semaphore.wait(wallTimeout: .distantFuture)
        
        group.notify(queue: .main) {
            print("Received: \(cardData?.data?[1].name ?? "load failed")")
        }

        return
    }
    
    
    var body: some View {
        HStack {
            TextField("Search", text: $searchTerm)
                .padding(.leading, 10)
                .font(.custom("Regular", size: 12))
                .disableAutocorrection(true)
            Button(
                action: {
                    loadData(searchTerm: "?q=name:\(searchTerm)*")
//                    print("Received: \(cardData?.data?[1].name ?? "load failed")")
//                    print("Expected \(searchTerm)")
                }, label: {
                    Text("GO!")
                        .padding(.leading, 10)
                        .padding(.trailing, 10)
                        .padding(.top, 5)
                        .padding(.bottom, 5)
                        .font(.custom("Regular", size: 12))
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(10.0)
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
