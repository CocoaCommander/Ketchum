//
//  APICaller.swift
//  Ketchum
//
//  Created by Ryan Lee on 6/2/21.
//

import Foundation



class APICaller {
    
    let API_KEY = "ff4617de-f79d-4bbe-a94f-bde94a28ccb1"
    var baseURL = "https://api.pokemontcg.io/v2/cards"
    var loadError: String = ""
    var data: CardDataModel? = nil
    
    func loadData(searchTerm: String) -> Void {
        guard let url = URL(string: (baseURL + searchTerm)) else {
            print("Invalid URL")
            return
        }
        
        var request = URLRequest(url: url)
        request.addValue(API_KEY, forHTTPHeaderField: "X-Api-Key")
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                do {
                    let decodedResponse = try JSONDecoder().decode(CardDataModel.self, from: data)
                    DispatchQueue.main.async {
                        self.data = decodedResponse
                        UserDefaults.standard.set(data, forKey: "cardData")
                    }
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
    }
}
