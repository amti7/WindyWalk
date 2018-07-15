//
//  List.swift
//  WindyWalk
//
//  Created by Kamil Gacek on 06/03/2018.
//  Copyright © 2018 Kamil Gacek. All rights reserved.
//

import Foundation
import ObjectMapper

class List: Mappable {
    
    var temperature: Double?
    var state: String?
    var date: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        temperature <- map["main.temp"]
        state <- map["weather.0.description"]
        date <- map["dt_txt"]
        
    }
    
}
