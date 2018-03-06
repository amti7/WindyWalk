//
//  City.swift
//  WindyWalk
//
//  Created by Kamil Gacek on 15/02/2018.
//  Copyright © 2018 Kamil Gacek. All rights reserved.
//

import Foundation
import ObjectMapper

class Forecast : Mappable { //: ForecastForNextDays{
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        cod <- map["main"]
        //temperature	<- map["day"]
        //message <- map["message"]
        // fahrenheit 	<- map["fahrenheit"]
        
        dt_txt <- map["dt_txt"]
        dt <- map["dt"]
    }
    var dt: Int?
    
    var dt_txt: String?
    
    var cod: Int?
    
    var message: Double?
    var id: Int? 
    var name: String?
    var time: String?
    var rain: Double?
    var humidity: Double?
    
    var state: String?
    var temperature: Double?
    var date: String?
}
