//
//  WordListView.swift
//  Englib
//
//  Created by Barış Uyar on 2.11.2019.
//  Copyright © 2019 Barış Uyar. All rights reserved.
//

import SwiftUI

struct WordListView: View {
    
    @ObservedObject private var wordListVM = WordListViewModel()
    
    @State private var showAddWord: Bool = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(self.wordListVM.words, id: \.id) { word in
                    WordCell(word: word)
                }
            }
        .navigationBarTitle("Kelimeler")
            .navigationBarItems(trailing: Button(action: showAddWordView) {
                Image(systemName: "plus")
                    .foregroundColor(Color.white)
            })
            
            .sheet(isPresented: self.$showAddWord) {
                AddWordView {
                    self.showAddWord = false
                    self.wordListVM.getWords()
                }
            }
        }
    }
    
    private func showAddWordView() {
        self.showAddWord = true
    }
    
    private func deleteWord(_ index: Int) {
        
    }
}

struct WordListView_Previews: PreviewProvider {
    static var previews: some View {
        WordListView()
    }
}
