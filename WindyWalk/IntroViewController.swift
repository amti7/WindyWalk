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
import ObjectMapper

extension Date {
    
    var noon: Date {
        return Calendar.current.date(bySettingHour: 15, minute: 0, second: 0, of: self)!
    }
    var oneDayAhead: Date {
        return Calendar.current.date(byAdding: .day, value: +1, to: noon)!
    }
    var twoDaysAhead: Date {
        return Calendar.current.date(byAdding: .day, value: +2, to: noon)!
    }
    var threeDaysAhead: Date {
        return Calendar.current.date(byAdding: .day, value: +3, to: noon)!
    }
    var fourDaysAhead: Date {
        return Calendar.current.date(byAdding: .day, value: +4, to: noon)!
    }
    
}

class IntroViewController: UIViewController {
    
 
    
    
    /*
    override func viewDidLoad() {
        super.viewDidLoad()
        // let forecast =  ForecastForTomorrow()
        //fillDataWithGivenApi(forecast: forecast, apiUrl: "http://samples.openweathermap.org/data/2.5/forecast?q=M%C3%BCnchen,DE&appid=b6907d289e10d714a6e88b30761fae22")
        
        //print(forecast.humidity)
        //printForecastForTomorrow(forecast: forecast)
        
        

        //calendar.date(from: DateComponents)
        //let currentDate = components.date + "-" + components.month + "-" + components.day + " 12:00:00"
        
        //fillDataWithGivenApi(forecast: forecast, apiUrl: "http://api.openweathermap.org/data/2.5/forecast?q=Krakow&appid=e3eeed175d5b660c006531bcb3a0117e")

        
        
        retrieveParamsUsingSwiftyJson(apiUrl: "https://jsonplaceholder.typicode.com/posts/1")
        // retrieveParamsUsingSwiftyJson(apiUrl: "http://api.openweathermap.org/data/2.5/forecast?q=Krakow&appid=e3eeed175d5b660c006531bcb3a0117e")
        
    }
     */
        ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    typealias JSONDict = [String: Any]

    
        override func viewDidLoad() {
            super.viewDidLoad()
            
            
            retrieveParamsByObjectMapper(path: "http://api.openweathermap.org/data/2.5/forecast?q=Krakow&appid=e3eeed175d5b660c006531bcb3a0117e")
            
            /*
            let path = "https://jsonplaceholder.typicode.com/posts/"
            
            guard let url = URL(string: path) else {
                return
            }
            
            URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data else {
                    return
                }
                
                do {
                    guard let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? Array<JSONDict> else {
                        return
                    }
                    
                    for post in json {
                        guard let p = Post(JSON: post) else {
                            return
                        }
                        
                        print("Post ID: \(p.id ?? -1)")
                        print("Post Title: \(p.title ?? "")")
                        print("Post Body: \(p.body ?? "")")
                        print()
                    }
                    
                } catch {
                    fatalError("Couldn't parse JSON")
                }
                
                }.resume()
            */
        }
        
        
        ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        
    func retrieveParamsByObjectMapper(path: String) {
        
        guard let url = URL(string: path) else {
            return
        }
        
        // typeAlias JSONDict [String:Any]
        // json as Array<JSONDict>
        // for array
        // Forecast(JSON: )
        
        // NSDictionary 
        // json as NSDictionary 
        // Forecast(
        
        //let dict: [String: Int]
        
        // let filledDict = [ "Kamil": 1, "Jadzia": 2 ]
        
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                return
            }
            
            
            
            do {
                guard let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? Dictionary<String,Any> else {
                    print("error")
                    return
                }
                
                print(json)
                
                if let forecast = Forecast(JSON: i){
                    print(forecast.cod ?? 0)
                }
                
                
                
                
                
                for dictElement in json {
                    
                   // let key = dictElement.key
                 //   print(dictElement)
                  //  print("***")
                   /*
                    if let forecast = Forecast(JSON: dictElement){
                        print(forecast.cod ?? 0)
                    } else {
                        print(".")
                    }
                    */
                }
                
                
                //print(json)
                //print("EE")
                //if let forecast = Forecast(JSON: json){
                //    print(forecast.cod ?? 0)
                //}
                
                //if let cod = json["city"] as? NSDictionary{
                 //   if let cityName = cod["name"] {
                        
                //    }
                //}
                
                //if let forecast = Forecast()
                
                // print(cod)
                
                //print(json)
                /*
                for forecastItem in json {
                    guard let forecast = Forecast(JSON: forecastItem) else {
                        return
                    }
                    print(forecastItem)
                    print("*")
                }
                
                */
                
                
            } catch {
                fatalError("Error: Unnable to parse JSON...")
            }
        
        
        }.resume()
    
    
    }


        
                //print(forecast)
                
                
            //let forecast = Mapper<Forecast>().map(NSDictionary: jsonDict)
                
                
                //let forecast = Forecast(map: jsonDict)
                //let temp = forecast
                
            
                
              //  let forecast =
                
                
            
            //if let dataDict = data as? NSDictionary {
             //   if let json = try? JSON(data: data!) {
                    
               //     if let msg = json["cod"].stringValue as? String {
                //        print(msg  + ":  ******" )
                 //   }
                    
                    /*
                    for itemList in json["list"].arrayValue {
                        if let dt = itemList["dt"].stringValue {
                            if let day = temp["day"].stringValue {
                              print(dt + " ******")
                            }
                        }
                    }
                    */
            //    }
           // }
            //if let json = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? NSDictionary {
        //    }
        //}).resume()
    
   
    
/*
    func fillDataWithGivenApi(forecast: ForecastForTomorrow,apiUrl: String){
        
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
    
    func obtainDataForTheDay(date: Date, formatter: DateFormatter) -> String {
        return formatter.string(from: date) //+ " 12:00:00"
    }
    
    
    


    func retrieveCityNameFromUser(){
        let cityName = "Krakow"

        var URL = "http://api.openweathermap.org/data/2.5/forecast?q="  + cityName + "&appid=e3eeed175d5b660c006531bcb3a0117e"
    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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



    
    


