//
//  ContentView.swift
//  Mini'sSecretDiary
//
//  Created by 차소민 on 2022/11/30.
//

import SwiftUI

struct ContentView: View {
   
    @State private var value = 3
    @State private var isEdit: Bool = false
    @State private var isSheet: Bool = false
    @State private var symbolArr = [Symbol(name: "tshirt"),
                                    Symbol(name: "eyes"),
                                    Symbol(name: "eyebrow")]
    @State private var isDelete: Bool = false
    
    var columns : [GridItem] {
        get {
            return Array<GridItem>.init(repeating: GridItem(), count: value) // value 3 -> 처음 3열
        }
    }
    
    var body: some View {
        NavigationStack {
            
            VStack {
    // Edit 아닐 때
                if isEdit == false {
                    ScrollView {
                        LazyVGrid(columns: columns) {
                            ForEach(0..<symbolArr.count, id: \.self) { index in
                                GridRow{
                                    NavigationLink(destination: SymbolDetail(symbol: symbolArr[index])) {
                                        Image(systemName: symbolArr[index].name)
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
//                                            .frame(width: 80)
                                            .padding()
                                    }
                                }
                            }
                        }
                    }
                    .sheet(isPresented: $isSheet) {
                        PlusView(symbolArr: $symbolArr, isSheet: $isSheet)
                            .presentationDetents([.large])
                            .presentationDragIndicator(.visible)
                    }
                    
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .principal) { //principal 중앙 배치
                            Text("My Symbols")
                                .font(.headline)
                        }
                    }
                    .navigationBarItems(trailing: Button{isSheet = true} label: {
                        Image(systemName: "plus")
                    })
                    .navigationBarItems(leading: Button{isEdit.toggle()} label: {
                        Text("Edit")
                    })
                }
                
    // Edit 중일때
                 else {
                    Stepper(value:$value){
                        Text("\(value) Columns")
                    }
                    .padding(.horizontal)
                    ScrollView {
                        LazyVGrid(columns: columns) {
                            ForEach(0..<symbolArr.count, id: \.self) { index in
                                GridRow{
                                    ZStack {
                                        Image(systemName: symbolArr[index].name)
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .foregroundColor(.accentColor)
                                            .padding()
                                            Button {
                                                symbolArr.remove(at: index)
                                                isDelete = true
                                            } label: {
                                                Image(systemName: "clear.fill")
                                                    .renderingMode(.original)
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fit)
                                                
                                                    .frame(width: 30)
                                            }
                                            .offset(x:25, y:-15)
                                    }
                                    .frame(width: 100, height: 100)
                                }
                            }
                        }
                    }
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .principal) {
                            Text("My Symbols")
                                .font(.headline)
                                .accessibilityAddTraits(.isHeader)
                        }
                    }
                    .navigationBarItems(trailing:
                        Image(systemName: "plus")
                        .foregroundColor(.gray)
                    )
                    .navigationBarItems(leading:
                                            Button{isEdit.toggle()} label: {
                        Text("Done")
                    })
                } //Edit 끝---
                
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
