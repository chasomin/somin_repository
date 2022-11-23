//
//  WebService.swift
//  TeamJasonList
//
//  Created by Sue on 2022/11/23.
//

import Foundation

class WebService {

    func fetchCampingData(url: String) async throws -> [Camping] {
        guard let url = URL(string: url) else { return [] }

        let (data, _) = try await URLSession.shared.data(from: url)
        let campings = try JSONDecoder().decode([Camping].self, from: data)
        
        let showingData = String(data: data, encoding: .utf8)!
        
        return campings
    }
    
    func fetchPetData(url: String) async throws -> [ResultList] {
        guard let url = URL(string: url) else { return [] }

        let (data, _) = try await URLSession.shared.data(from: url)
        let pets = try JSONDecoder().decode([Results].self, from: data)
        let resultList = pets[0].resultList
        
        print(resultList)

        return resultList
    }
    
    
    func fetchJinjuData(url: String) async throws -> [JinjuRestaurant] {
        guard let url = URL(string: url) else { return [] }

        let (data, _) = try await URLSession.shared.data(from: url)
//        let showingData = String(data: data, encoding: .utf8)!
//        print("\(showingData)")
        let jinjues = try JSONDecoder().decode(JinjuResult.self, from: data)
        let jinjuRestaurants = jinjues.results
        
        print("\(jinjuRestaurants)")

        return jinjuRestaurants
    }
    
    
    
    func fetchWeatherData(url: String) async throws -> [Item] {
        guard let url = URL(string: url) else { return [] }

        let (data, _) = try await URLSession.shared.data(from: url)
        let weathers = try JSONDecoder().decode(WeatherModel.self, from: data)
        
        let items = weathers.response.body.items.item
        
        print(weathers)
        return items
    }
}


