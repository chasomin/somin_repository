//
//  ContentView.swift
//  TeamJasonList
//
//  Created by Sue on 2022/11/23.
//

import SwiftUI

struct NameAndData: Hashable {
    let name: String
    let url: String
    let dataName: String
}

struct ContentView: View {
//
//    let nameAndData: [NameAndData] = [
//        NameAndData(name: "수현", url: "https://mocki.io/v1/cfe9c0af-02e6-49a5-b8b0-ee9acd0e7f6b", dataName: "캠핑"),
//        NameAndData(name: "미지", url: "https://www.pettravel.kr/api/listArea.do?page=1&pageBlock=10&areaCode=AC01", dataName: "반려동물 식음료"),
//        NameAndData(name: "소영", url: "https://www.jinju.go.kr/openapi/tour/restaurant.do", dataName: "진주 식당"),
//        NameAndData(name: "소민", url: "https://mocki.io/v1/364254a5-c138-4a98-a788-2d9308c16127", dataName: "날씨")
//
//
//    ]
//
//    let name: [String] = [
//        "수현",
//        "미지",
//        "소영",
//        "소민"
//    ]
//
//    let dataName: [String] = [
//        "캠핑",
//        "반려동물 식음료",
//        "진주식당",
//        "날씨"
//    ]
//
    var body: some View {
        NavigationStack {
            
            List {
                    NavigationLink {
                        WeatherChartsView(url: "https://mocki.io/v1/364254a5-c138-4a98-a788-2d9308c16127")
                    } label: {
                        Text("소민: 광화문 날씨")
                    }
                
                NavigationLink {
                    PetsFoodMapView(url: "https://www.pettravel.kr/api/listArea.do?page=1&pageBlock=10&areaCode=AC01")
                } label: {
                    Text("미지: 반려동물 식음료")
                }
                
                NavigationLink {
                    JinjuListView(url: "https://mocki.io/v1/63639032-692e-4c48-820b-cedde014200f")
                } label: {
                    Text("소영: 진주 식당")
                }
                
                NavigationLink {
                    CampingListView(url: "https://mocki.io/v1/cfe9c0af-02e6-49a5-b8b0-ee9acd0e7f6b")
                } label: {
                    Text("수현: 캠핑")
                }

            }
            .navigationTitle("Team6_Json_App")
        }
        
    }
}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}




// #1
/*
ForEach(0 ..< name.count, id: \.self) { index in
    NavigationLink {
        
    } label: {
        Text("\(name[index]): \(dataName[index])")
    }
}
 */

// #2
/*
ForEach(0 ..< nameAndData.count, id: \.self) { (index) in
    NavigationLink {
        JasonTextView(url: nameAndData[index].url)
    } label: {
        Text("\(nameAndData[index].name): \(nameAndData[index].dataName)")
    }
}
 */

// #3
//                ForEach(nameAndData, id: \.self) { (item) in
