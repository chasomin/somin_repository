//
//  PlusView.swift
//  Mini'sSecretDiary
//
//  Created by 차소민 on 2022/11/30.
//

import SwiftUI

struct PlusView: View {
    var columns : [GridItem] {
        get {
            return Array<GridItem>.init(repeating: GridItem(), count: 4)
        }
    }
    @Binding var symbolArr: [Symbol]
    @Binding var isSheet: Bool
    
    var body: some View {
        ScrollView{
            LazyVGrid(columns: columns){
                ForEach(pickableSymbols) { item in
                    Button {
                        symbolArr += [item]
                        isSheet = false
                    } label: {
                        Image(systemName: item.name)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 80)
                    }

                }
                
            }
        }
    }
}

//struct PlusView_Previews: PreviewProvider {
//    static var previews: some View {
//        PlusView(symbolArr: Symbol(name: ""))
//    }
//}
