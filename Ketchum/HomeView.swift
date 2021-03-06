//
//  HomeView.swift
//  Ketchum
//
//  Created by Ryan Lee on 6/2/21.
//

import SwiftUI
import Network

struct HomeView: View {
    
    @State var loadError: String = ""
    @State var cardDataSearch: CardDataModel? = nil
    @EnvironmentObject var userStore: UserStorage
    @State var showError: Bool = false

    @ViewBuilder
    var body: some View {
        VStack {
            HStack {
                Image("pokeball")
                    .resizable()
                    .renderingMode(.original)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: CGFloat(100), height: CGFloat(100))
                Text("Ketchum")
                    .font(.custom("Bold", size: 30))
            }
            SearchBar(loadError: $loadError, cardData: $cardDataSearch)
            Text("try searching pikachu!")
                .font(.custom("ExtraLight", size: 12))
            if cardDataSearch != nil {
                
                //add environment object
                SearchResultsView(cardData: $cardDataSearch).environmentObject(userStore)
            }
        }

    }
}

struct SearchBar: View {
    
    @State var searchTerm: String = ""
    let API_KEY = "ff4617de-f79d-4bbe-a94f-bde94a28ccb1"
    var baseURL = "https://api.pokemontcg.io/v2/cards"
    @Binding var loadError: String
    @Binding var cardData: CardDataModel?
    @State var showError: Bool = false
    
    var monitor = NWPathMonitor()

    
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
                        UserDefaults.standard.set(data, forKey: "cardData")
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
        .onAppear {
            if let data = UserDefaults.standard.data(forKey: "cardData") {
                do {
                    // Create JSON Decoder
                    let decoder = JSONDecoder()

                    // Decode Note
                    self.cardData = try decoder.decode(CardDataModel.self, from: data)

                } catch {
                    print("Unable to Decode quizData (\(error))")
                }
            }
            monitor.pathUpdateHandler = { path in
                if path.status == .satisfied {
                    return
                } else {
                    self.loadError = "No internet connection."
                }
            }
            let queue = DispatchQueue(label: "Monitor")
            monitor.start(queue: queue)
            
            if self.loadError != "" {
                self.showError = !self.showError
            }
        }
        .alert(isPresented: $showError) {
            Alert(
                title: Text("Error"),
                message: Text("Not connected to the network")
            )
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
