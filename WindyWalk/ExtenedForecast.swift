//
//  ExtenedForecast.swift
//  WindyWalk
//
//  Created by Kamil Gacek on 06/03/2018.
//  Copyright © 2018 Kamil Gacek. All rights reserved.
//

import Foundation
import ObjectMapper

class ExtendedForecast: Mappable {
    
    var temperature: Double?
    var state: String?
    var wind: Double?
    var date: String?
    var cityName: String?
    var downfall: Double?
    var typeOfDownfall: String?
    var humidity: Double?
    
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        temperature <- map["list.0.main.temp"]
        state <- map["list.0.weather.0.description"]
        wind <- map["list.0.wind.speed"]
        date <- map["list.0.dt_txt"]
        cityName <- map["city.name"]
        humidity <- map["list.0.main.humidity"]

        if( map["list.0.rain.3h"] != nil) {
            print(map["list.0.rain.3h"])
            typeOfDownfall = "Rainn"
            downfall <- map["list.0.rain.3h"]
        } else if( map["list.0.snow.3h"] != nil ) {
            typeOfDownfall = "Snow"
            downfall <- map["list.0.snow.3h"]
        } else {
            typeOfDownfall = ""
            downfall = nil
        }
    }
}
