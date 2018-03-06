//
//  ForecastForTomorrowViewController.swift
//  WindyWalk
//
//  Created by Kamil Gacek on 21/02/2018.
//  Copyright © 2018 Kamil Gacek. All rights reserved.
//

import Foundation
import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet var cityNameLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var stateLabel: UILabel!
    @IBOutlet var temperatureLabel: UILabel!
    @IBOutlet var humidityLabel: UILabel!
    @IBOutlet var rainLabel: UILabel!
    
    override func viewDidLoad() {
        
    }
  
   // let forecast =  ForecastForTomorrow()
    
    override func viewWillAppear(_ animated: Bool) {
        
      //  fillDataWithGivenApi(forecast: forecast, apiUrl: "http://samples.openweathermap.org/data/2.5/forecast/daily?q=M%C3%BCnchen,DE&appid=b6907d289e10d714a6e88b30761fae22")
        //fillDataWithGivenApi(forecast: forecast, apiUrl: "http://api.openweathermap.org/data/2.5/forecast?q=Krakow&appid=e3eeed175d5b660c006531bcb3a0117e")
  
       
    }
    
    override func viewDidAppear(_ animated: Bool) {
        

    }
    /*
    override func viewDidLayoutSubviews() {
        provideParametersInLabels()
    }
    
    func fillDataWithGivenApi(forecast: Forecast,apiUrl: String){
        
        var currentDate =  "2018-02-23 15:00:00"
        
        let url = NSURL(string: apiUrl)
        URLSession.shared.dataTask(with: (url as URL?)!, completionHandler: {(data, response, error) -> Void in
            if let jsonObj = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? NSDictionary {
                if let list = jsonObj!.value(forKey: "list") as? NSArray {
                    for itemList in list {
                        
                        var isDesiredInForecast = false
                        
                        if let listDict = itemList as? NSDictionary {
                            if let dateTime = listDict.value(forKey: "dt_txt") as? String {
                                if (dateTime == currentDate ){
                                    forecast.date = dateTime
                                    isDesiredInForecast = true
                                }
                            }
                            if(isDesiredInForecast){
                                if let tempDict = listDict.value(forKey: "temp") as? NSDictionary {
                                    if let day = tempDict.value(forKey: "day") as? Double {
                                        forecast.temperature = day
                                        print(day)
                                    }
                                    if let humidity = tempDict.value(forKey: "humidity") as? Double {
                                        forecast.humidity = humidity
                                    }
                                }
                                
                                if let weatherArr = listDict.value(forKey: "weather") as? NSArray {
                                    for singleWeather in weatherArr {
                                        if let weather = singleWeather as? NSDictionary{
                                            if let main = weather.value(forKey: "main") as? String {
                                                forecast.state = main
                                            }
                                        }
                                    }
                                }
                                if let rainDict = listDict.value(forKey: "rain") as? NSDictionary {
                                    if let rain = rainDict.value(forKey: "3h") as? Double {
                                        forecast.rain = rain
                                    }
                                }
                            }
                        }
                    }
                }
                if let city = jsonObj!.value(forKey: "city") as? NSDictionary {
                    if let cityName = city.value(forKey: "name") as? String {
                        forecast.name = cityName
                    }
                }
            }
        }).resume()
    }
    */
    /*
    func provideParametersInLabels() {
        if let city = forecast.name {
            cityNameLabel.text = city
        }
        if let date = forecast.date {
            dateLabel.text = date
        }
        if let state = forecast.state {
            stateLabel.text = state
        }
        if let temperature = forecast.temperature {
            temperatureLabel.text = String(temperature)
        }
        if let humidity = forecast.humidity {
            humidityLabel.text = String(humidity)
        }
        if let rain = forecast.rain {
            rainLabel.text = String(rain)
        }
    }
     */
    /*
    func validateForecastParameter<T>(parameter: T,label: UILabel){
        if var param = parameter {
            label.text = param
        }  // TODO
    }
    */

}
