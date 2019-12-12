//
//  WordListViewModel.swift
//  Englib
//
//  Created by Barış Uyar on 3.11.2019.
//  Copyright © 2019 Barış Uyar. All rights reserved.
//

import Foundation

class WordListViewModel: ObservableObject {
    
    @Published var words = [Word]()
    
    init() {
        getWords()
    }
    
    func getWords() {
        WebService().getWords { words in
            guard let words = words else { return }
            self.words = words
        }
    }
}
