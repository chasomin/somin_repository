//
//  Jinju.swift
//  TeamJasonList
//
//  Created by 이소영 on 2022/11/23.
//


import Foundation

//원래 json에 있던 그대로 다 작성을 해줘야 한다..!
//가장 바깥 { }
struct JinjuResult: Codable, Hashable {
    let record_count: Int
    let address: String
    let name: String
    let pageunit: Int
    let page: Int
    let results: [JinjuRestaurant]
    let page_count: Int
    let status: String
}

struct JinjuRestaurant: Codable, Hashable {
    //let idx: Int
    let idx: Int
    let name, category, area: String
    let phone: String
    let address: String
    let homepage: String
    let businesshour, holiday: String
    let content: String
    let menuprice: String
    let xposition, yposition: String
    let images: [String]
}
