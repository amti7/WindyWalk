//
//  WeekForecast.swift
//  WindyWalk
//
//  Created by Kamil Gacek on 06/03/2018.
//  Copyright © 2018 Kamil Gacek. All rights reserved.
//

import Foundation
import ObjectMapper

class Forecast {
    
    var temperature: Double?
    var state: String?
    var date: String?
    
    init?(mTemperature: Double, mState: String, mDate: String) {
        temperature = mTemperature
        state = mState
        date = mDate
    }

}
