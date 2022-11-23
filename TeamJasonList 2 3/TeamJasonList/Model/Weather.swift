//
//  Weather.swift
//  TeamJasonList
//
//  Created by 차소민 on 2022/11/23.
//

import Foundation

// MARK: - WeatherModel
struct WeatherModel: Codable, Hashable {
    let response: Response
}

// MARK: - Response
struct Response: Codable, Hashable  {
    let header: Header
    let body: Body
}

// MARK: - Body
struct Body: Codable, Hashable  {
    let dataType: String
    let items: Items
    let pageNo, numOfRows, totalCount: Int
}

// MARK: - Items
struct Items: Codable, Hashable  {
    let item: [Item]
}

// MARK: - Item
struct Item: Codable, Hashable  {
    let baseDate, baseTime, category, fcstDate: String
    let fcstTime, fcstValue: String
    let nx, ny: Int
}

// MARK: - Header
struct Header: Codable, Hashable  {
    let resultCode, resultMsg: String
}
