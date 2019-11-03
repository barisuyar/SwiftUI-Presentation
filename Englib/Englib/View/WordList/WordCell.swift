//
//  WordCell.swift
//  Englib
//
//  Created by Barış Uyar on 2.11.2019.
//  Copyright © 2019 Barış Uyar. All rights reserved.
//

import SwiftUI

struct WordCell: View {
    var word: Word
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            VStack {
                HStack {
                    Spacer()
                    Text(word.word).foregroundColor(.white)
                    Spacer()
                }
                Rectangle()
                .fill(Color.white)
                .frame(width: 200, height: 1)
                Text(word.mean).foregroundColor(.white)
            }.padding(EdgeInsets(top: 4, leading: 0, bottom: 10, trailing: 0))
                .background(Color.orange)
            HStack {
                Spacer()
                Text(word.sentence).lineLimit(10)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.gray)
                Spacer()
            }.padding(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8))
        }.cornerRadius(15)
         .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.orange, lineWidth: 1)
          )
        .padding(EdgeInsets(top: 0, leading: 16, bottom: 8, trailing: 16))
        
        
    }
}

struct WordCell_Previews: PreviewProvider {
    static var previews: some View {
        WordCell(word: Word(word: "ajhsdkajsdjk", mean: "asdkasd", sentence: "Auhasduhasudhasd asdasdasd adsasda asdoıasd asdoıa oısdao ıasdo oaısd", synonym: "aısdhauhsd"))
    }
}