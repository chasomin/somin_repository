//
//  CampingStore.swift
//  TeamJasonList
//
//  Created by Sue on 2022/11/23.
//

import SwiftUI
import Combine

class CampingStore : ObservableObject {
    
    @Published var campings: [Camping]
    
    init (campings: [Camping] = []) {
        self.campings = campings
    }
}
