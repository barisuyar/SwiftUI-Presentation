//
//  AddWordViewModel.swift
//  Englib
//
//  Created by Barış Uyar on 3.11.2019.
//  Copyright © 2019 Barış Uyar. All rights reserved.
//

import Foundation

class AddWordViewModel: ObservableObject {
    var word: String = ""
    var mean: String = ""
    var sentence: String = ""
    var synonym: String = ""
    
    private var service: WebService
    
    init() {
        service = WebService()
    }
    
    func add(completion: @escaping (Bool) -> ()) {
        service.save(Word(word: word, mean: mean, sentence: sentence, synonym: synonym)) { (response) in
            DispatchQueue.main.async {
                completion(response?.success ?? false)
            }
        }
    }
}
