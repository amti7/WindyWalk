//
//  ForecastForTomorrowViewController.swift
//  WindyWalk
//
//  Created by Kamil Gacek on 21/02/2018.
//  Copyright © 2018 Kamil Gacek. All rights reserved.
//

import Foundation
import UIKit

enum ErrorType: Error {
    case ForecastDataNotObtained
    
}

class MainViewController: UIViewController {
    
    @IBOutlet var cityNameLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var stateLabel: UILabel!
    @IBOutlet var temperatureLabel: UILabel!
    @IBOutlet var humidityLabel: UILabel!
    @IBOutlet var downFallLabel: UILabel!
    @IBOutlet var downFallValueLabel: UILabel!
    @IBOutlet var windLabel: UILabel!
    @IBOutlet weak var mainImageView: UIImageView!
    
    var forecast: ExtendedForecast?
    var forecastArray: Array<Forecast> = []

    override func viewDidLoad() {
        do {
            try self.fillUIWithObtainedData(forecast: forecast!)
        } catch ErrorType.ForecastDataNotObtained(let description) {
            print(description)
        }
        displayProperIconToWeatherState(extForecast: forecast!,weatherIconImage:  mainImageView)
    }

    func fillUIWithObtainedData(forecast: ExtendedForecast){
        if let temperature = forecast.temperature, let state = forecast.state, let wind = forecast.wind, let date = forecast.date, let cityName = forecast.cityName, let humidity = forecast.humidity {
            temperatureLabel.text = String(transposeWeatherParamToStringInCelcius(temp: temperature))
            stateLabel.text = state
            windLabel.text = String(describing: wind) + " m/s"
            dateLabel.text = date
            cityNameLabel.text = String(cityName)
            humidityLabel.text = String(forecast.humidity!) + " %"
            if let downfall = forecast.downfall { downFallValueLabel.text = String(describing: downfall) + " mm"
            } else { downFallValueLabel.text = "0 mm" }
        }
    }
    
    func transposeWeatherParamToStringInCelcius(temp: Double) -> String{
        let temperaturToReturn = String(describing: (Double(round( 10 * (temp - 273.15))/10))) + "°c"
        return temperaturToReturn
    }
    
    func displayProperIconToWeatherState(extForecast: ExtendedForecast, weatherIconImage: UIImageView){
        var weatherState = ""
        if let weatherParam = Optional(extForecast) {
            switch(weatherParam.state!){
            case "clear sky":
                if(weatherParam.date?.hasSuffix("00:00:00"))!{
                    weatherState =  "clear-night"
                } else {
                    weatherState =  "clear"
                }
            case "scattered clouds","broken clouds","scattered clouds","few clouds","overcast clouds":
                if(weatherParam.date?.hasSuffix("00:00:00"))!{
                    weatherState =  "cloudy-night"
                } else {
                    weatherState =  "cloudy"
                }
            case "light rain","moderate rain":
                weatherState =  "rain"
            case "light snow":
                weatherState =  "snow"
            default:
                weatherState =  "default"
            }
        }
        let image: UIImage = UIImage(named: weatherState)!
        weatherIconImage.image = image
        self.view.addSubview(weatherIconImage)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let DestViewController: DetailsViewController = segue.destination as! DetailsViewController
        DestViewController.forecastArrayFromMainVC = forecastArray
    }
}
