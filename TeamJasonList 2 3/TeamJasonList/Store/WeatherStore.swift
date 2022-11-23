//
//  WeatherStore.swift
//  TeamJasonList
//
//  Created by 차소민 on 2022/11/23.
//

import Foundation
import Combine

class WeatherStore : ObservableObject {
    
    @Published var weathers: [Item]
    
    init (weathers: [Item] = []) {
        self.weathers = weathers
    }
}
