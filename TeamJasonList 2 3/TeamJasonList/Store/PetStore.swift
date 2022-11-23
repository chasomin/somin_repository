//
//  PetStore.swift
//  TeamJasonList
//
//  Created by Jero on 2022/11/23.
//

import Foundation
import Combine

class PetStore: ObservableObject {
    @Published var pets: [ResultList]
    
    init (pets: [ResultList] = []) {
        self.pets = pets
    }
}
