//
//  ViewController.swift
//  WindyWalk
//
//  Created by Kamil Gacek on 15/02/2018.
//  Copyright © 2018 Kamil Gacek. All rights reserved.
//
/*
 V 1. zrobic tak zeby prawdziwe api dzialalo
 V 2. przechwytywanie miasta od uzytkownika
 3. uzupelnienie danych w strukturze
 4. wyswietlanie danych na glownym widoku 
 5. dodanie kolejnego Widoku 
 6. wyswietlenie danych na kolejnym widoku 
 7. Parsownaie Jsona wg biblioteki 
 
 */


import UIKit


class ViewController: UIViewController {
    
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let forecast =  ForecastForTomorrow()
        fillDataWithGivenApi(forecast: forecast, apiUrl: "http://samples.openweathermap.org/data/2.5/forecast?q=M%C3%BCnchen,DE&appid=b6907d289e10d714a6e88b30761fae22")
        
        print(forecast.humidity)
        // printForecastForTomorrow(forecast: forecast)
    }
    

    func retrieveCityNameFromUser(){
        let cityName = "Krakow"

        var URL = "http://api.openweathermap.org/data/2.5/forecast?q="  + cityName + "&appid=e3eeed175d5b660c006531bcb3a0117e"
    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func printForecastForTomorrow(forecast: ForecastForTomorrow) {
        
        
        
        
        
        print(forecast.humidity)
        print(forecast.name)
        print(forecast.time)
        print(forecast.rain)
        print(forecast.date)
        print(forecast.state)
        print(forecast.temperature)
    }
    
    
    
    func fillDataWithGivenApi(forecast: ForecastForTomorrow,apiUrl: String){
        
      
        
        // var location: Location
        // let date = Date()
        // let formatter = DateFormatter()
        // formatter.dateFormat = "yyyy-MM-dd HH:MM:SS"
        
        
        var currentDate = "2017-02-17"
        currentDate = currentDate + " 12:00:00"
        //print(currentDate)
         // let dateTxt = dateTime.characters.split{$0 == " "}.map(String.init)
        
        let url = NSURL(string: apiUrl)
        URLSession.shared.dataTask(with: (url as URL?)!, completionHandler: {(data, response, error) -> Void in
            
            if let jsonObj = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? NSDictionary {
                
                //goDeeper<NSDictionary,String>("message", jsonObj)
                
                
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
                                if let mainDict = listDict.value(forKey: "main") as? NSDictionary {
                                    if let temp = mainDict.value(forKey: "temp") as? Double {
                                        forecast.temperature = temp
                                    }
                                    if let humidity = mainDict.value(forKey: "humidity") as? Double {
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

    /*
    func goDeeper<T: AnyObject, U: AnyObject>(key: String, objectToParse: U) {
        if let property = objectToParse.value(forKey: key) as? T {
            print(property)
        }
    }*/
    /*
    func genericExample<T: AnyObject>(key: T, objectToParse: T){
        if let property = objectToParse.value(forKey: key) as? T {
            
        } else {
            print("EE")
        }
    }
    */
    
    
    func retrieveDataFromJsonForDailyForecast(){
        
    }
    
    func retrieveDataFromJsonForNextDay(){
        
    }
    
    func retrieveDataFromJsonForNextFewDays() {
        
    }
    
    
    
    
    
    
}

