//
//  Camping.swift
//  TeamJasonList
//
//  Created by Sue on 2022/11/23.
//

import Foundation

struct Camping: Codable, Hashable {
    var SIGUN_NM: String
    var SI_DESC: String // 캠핑장 이름
    var TELNO: String
    var DATA_STD_DE: String
    var REFINE_ROADNM_ADDR: String
    var REFINE_LOTNO_ADDR: String  //주소
    var REFINE_ZIPNO: String
    var REFINE_WGS84_LAT: String
    var REFINE_WGS84_LOGT: String
    
}
