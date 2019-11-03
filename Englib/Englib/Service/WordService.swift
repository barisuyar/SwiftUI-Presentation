//
//  WordService.swift
//  Englib
//
//  Created by Barış Uyar on 3.11.2019.
//  Copyright © 2019 Barış Uyar. All rights reserved.
//

import Foundation


class WebService {
    func getWords(completion: @escaping ([Word]?) -> ()){
        guard let url = URL(string: "https://temporal-pisces.glitch.me/word") else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }
            
            let words = try? JSONDecoder().decode([Word].self, from: data)
            DispatchQueue.main.async {
                completion(words)
            }
        }.resume()
    }
    
    func save(_ word: Word, completion: @escaping (AddedModel?) -> ()) {
        guard let url = URL(string: "https://temporal-pisces.glitch.me/word") else {
            fatalError("Invalid URL")
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(word)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }
            
            let response = try? JSONDecoder().decode(AddedModel.self, from: data)
            DispatchQueue.main.async {
                completion(response)
            }
           
            
        }.resume()
    }
}
