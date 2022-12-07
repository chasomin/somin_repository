//
//  SymbolDetail.swift
//  Mini'sSecretDiary
//
//  Created by 차소민 on 2022/11/30.
//

import SwiftUI

struct SymbolDetail: View {
    var symbol: Symbol
    var body: some View {
        VStack {
            if symbol.name.contains(".fill"){
                Text(symbol.name.filter{!".fill".contains($0)})
                    .font(.title)
                Image(systemName: symbol.name)
                    .resizable()
                    .frame(width: 150,height: 150)
                
            } else{
                Text(symbol.name)
                    .font(.title)
                Image(systemName: symbol.name)
                    .resizable()
                    .frame(width: 150,height: 150)
            }
        }
    }
}

struct SymbolDetail_Previews: PreviewProvider {
    static var previews: some View {
        SymbolDetail(symbol: Symbol(name: pickableSymbols[1].name))
    }
}
