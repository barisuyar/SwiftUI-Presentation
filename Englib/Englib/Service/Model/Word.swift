//
//  Word.swift
//  Englib
//
//  Created by Barış Uyar on 3.11.2019.
//  Copyright © 2019 Barış Uyar. All rights reserved.
//

import Foundation

struct Word: Codable {
    let id = UUID()
    let word: String
    let mean: String
    let sentence: String
    let synonym: String
}
