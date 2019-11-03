//
//  AddWordView.swift
//  Englib
//
//  Created by Barış Uyar on 2.11.2019.
//  Copyright © 2019 Barış Uyar. All rights reserved.
//

import SwiftUI

struct AddWordView: View {
    @ObservedObject var addWordViewModel: AddWordViewModel = AddWordViewModel()
    var onDismiss: () -> ()
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("Word")) {
                        TextField("", text: $addWordViewModel.word)
                    }
                    
                    Section(header: Text("Mean")) {
                        TextField("Enter Mean..", text: $addWordViewModel.mean)
                    }
                    
                    Section(header: Text("Synonym")) {
                        TextField("Enter Synonym..", text: $addWordViewModel.synonym)
                    }
                    
                    Section(header: Text("Sentence")) {
                        TextField("Enter Sentence..", text: $addWordViewModel.sentence)
                            .font(.subheadline)
                    }
                    
                    Button("Add Order") {
                        self.addWordViewModel.add { (response) in
                            self.onDismiss()
                        }
                    }
                }
            }
        .navigationBarTitle("Add Word")
        }
    }
}
