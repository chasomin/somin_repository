//
//  JinjuStore.swift
//  TeamJasonList
//
//  Created by 차소민 on 2022/11/23.
//

import Foundation
import Combine

class JinjuStore: ObservableObject {
    @Published var jinjues: [JinjuRestaurant]
    
    init (jinjues: [JinjuRestaurant] = []) {
        self.jinjues = jinjues
    }
}
