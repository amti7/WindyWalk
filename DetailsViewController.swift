//
//  ForecastForNextDaysViewController.swift
//  WindyWalk
//
//  Created by Kamil Gacek on 22/02/2018.
//  Copyright © 2018 Kamil Gacek. All rights reserved.
//

import Foundation
import UIKit



class DetailsViewController: UIViewController {
    
    @IBOutlet var dateOneAhead: UILabel!
    @IBOutlet var dateTwoAhead: UILabel!
    @IBOutlet var dateThreeAhead: UILabel!
    @IBOutlet var dateFourAhead: UILabel!
    
    @IBOutlet var tempOneAhead: UILabel!
    @IBOutlet var tempTwoAhead: UILabel!
    @IBOutlet var tempThreeAhead: UILabel!
    @IBOutlet var tempFourAhead: UILabel!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    //    let forecast = ForecastForTomorrow()
        //fillDataWithGivenApi(forecast: forecast, apiUrl: "http://api.openweathermap.org/data/2.5/forecast?q=Krakow&appid=e3eeed175d5b660c006531bcb3a0117e")
      //   fillDataWithGivenApi(forecast: forecast, apiUrl: "http://samples.openweathermap.org/data/2.5/forecast/daily?q=M%C3%BCnchen,DE&appid=b6907d289e10d714a6e88b30761fae22")

      //  var ArrayOfForecast = [forecastOneAhead, forecastTwoAhead, forecastThreeAhead, forecastFourAhead]
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        
     //   fillDataWithGivenApi(forecast: forecast, apiUrl: "http://samples.openweathermap.org/data/2.5/forecast?q=M%C3%BCnchen,DE&appid=b6907d289e10d714a6e88b30761fae22")
        
    }
    
    
    func fillLabelOnUI() {
        
    }
    
    /*
    func fillDataWithGivenApi(forecast: ForecastForTomorrow,apiUrl: String){
        
        let url = NSURL(string: apiUrl)
        URLSession.shared.dataTask(with: (url as URL?)!, completionHandler: {(data, response, error) -> Void in
            if let jsonObj = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? NSDictionary {
                if let list = jsonObj!.value(forKey: "list") as? NSArray {
                    for itemList in list {
                        if let listDict = itemList as? NSDictionary {
                            if let tempDict = listDict.value(forKey: "temp") as? NSDictionary {
                                if let day = tempDict.value(forKey: "day") as? Double {
                                    forecast.temperature = day
                                    print("A")
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
                        }
                    }
                }
            }
        }).resume()
    }

    */
    
    
    /*
    func fillDataWithGivenApi(forecast: ForecastForTomorrow,apiUrl: String){
        
        let RFC3339DateFormatter = DateFormatter()
        RFC3339DateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        var date = Date().noon
        var dateString = RFC3339DateFormatter.string(from: date)
        
        // print(dateString)
        
        print(RFC3339DateFormatter.weekdaySymbols[Calendar.current.component(.weekdayOrdinal, from: date)])
        print(dateString)
        date = Calendar.current.date(byAdding: .day, value: +1, to: date)!
        dateString = RFC3339DateFormatter.string(from: date)
        print(dateString)
        
        
        
        var date2 = Date().oneDayAhead
        print(RFC3339DateFormatter.weekdaySymbols[Calendar.current.component(.weekdayOrdinal, from: date2)])
        print(dateString)
        date = Calendar.current.date(byAdding: .day, value: +1, to: date)!
        dateString = RFC3339DateFormatter.string(from: date)
        
        let url = NSURL(string: apiUrl)
        URLSession.shared.dataTask(with: (url as URL?)!, completionHandler: {(data, response, error) -> Void in
            
            if let jsonObj = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? NSDictionary {
            
                if let list = jsonObj!.value(forKey: "list") as? NSArray {
                    for itemList in list {
                        
                        print(list.count)
                        
                        var isDesiredInForecast = false
                        
                        if let listDict = itemList as? NSDictionary {
                            
                            
                            
                            if let dateTime = listDict.value(forKey: "dt_txt") as? String {
                               // print(dateTime + " ***")
                                if (dateTime == dateString ){
                                    //print("bb")

                                    isDesiredInForecast = true
                                //    print(RFC3339DateFormatter.weekdaySymbols[Calendar.current.component(.weekdayOrdinal, from: date)])
                                 //   print(dateString)
                                    date = Calendar.current.date(byAdding: .day, value: +1, to: date)!
                                    dateString = RFC3339DateFormatter.string(from: date)
                                  
                                }
                            }
                            if(isDesiredInForecast){
                                if let mainDict = listDict.value(forKey: "main") as? NSDictionary {
                                    if let temp = mainDict.value(forKey: "temp") as? Double {
                                        // forecast.temperature = temp
                                        //print(temp)
                                    }
                                }
                                if let weatherArr = listDict.value(forKey: "weather") as? NSArray {
                                    for singleWeather in weatherArr {
                                        if let weather = singleWeather as? NSDictionary{
                                            if let main = weather.value(forKey: "main") as? String {
                                                // forecast.state = main
                                                //print(main)
                                            }
                                        }
                                    }
                                }
                                
                            }
                        }
                    }
                }
            }
        }).resume()
    }
 */
    
    
}











