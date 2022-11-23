//
//  Pet.swift
//  TeamJasonList
//
//  Created by Jero on 2022/11/23.
//

import Foundation

struct Results: Codable, Hashable {
  var resultList : [ResultList]
  var totalCount : Int
  var message    : String
}

struct ResultList: Codable, Hashable {
  var contentSeq : Int
  var areaName   : String
  var partName   : String
  var title      : String
  var address    : String
  var latitude   : String
  var longitude  : String
  var tel        : String
}
