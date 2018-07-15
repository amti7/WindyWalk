//
//  ExtendedForecast.swift
//  WindyWalk
//
//  Created by Kamil Gacek on 06/03/2018.
//  Copyright © 2018 Kamil Gacek. All rights reserved.
//

import Foundation
import ObjectMapper

class WeekForecast: Mappable {
    
    var forecastArray = Array<Forecast>()
    var list = Array<List>()
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        list <- map["list"]
        var i = 0
        for listItem in list {
            i += 1
            // TODO Think about it. Is it necesarry to put all data into array, if you are interested in a specific cases?
            var forecast = Forecast(mTemperature: listItem.temperature!, mState: listItem.state!,mDate: listItem.date!)
            forecastArray.append(forecast!)
        }
    }
}
